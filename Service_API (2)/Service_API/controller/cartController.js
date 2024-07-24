const Cart=require("../models/cart");
const Product=require("../models/product");
const Order=require("../models/order");

const cartController={
    addCart: async (req,res)=>{
        try{
            const { productId, quantity } = req.body;
            const userId = req.user.id;

          

            let cart = await Cart.findOne({ user: userId });

            // Nếu không có giỏ hàng, tạo mới
            if (!cart) {
                cart = new Cart({ user: userId, items: [], totalPrice: 0 });
            }
    
            // Kiểm tra sản phẩm
            const product = await Product.findById(productId);
            if (!product) {
                return res.status(404).json({ message: "Sản phẩm không tồn tại" });
            }
    
            // Kiểm tra xem sản phẩm đã có trong giỏ hàng chưa
            const cartItemIndex = cart.items.findIndex(item => 
                item.product.toString() === productId
            );
    
            if (cartItemIndex > -1) {
                // Nếu sản phẩm đã có, cập nhật số lượng
                cart.items[cartItemIndex].quantity += quantity;
            } else {
                // Nếu sản phẩm chưa có, thêm mới vào giỏ hàng
                cart.items.push({ product: productId, quantity });
            }
    
            // Cập nhật tổng giá
            cart.totalPrice = await cart.items.reduce(async (totalPromise, item) => {
                const total = await totalPromise;
                const product = await Product.findById(item.product);
                return total + (item.quantity * product.price);
            }, Promise.resolve(0));
    
            // Lưu giỏ hàng
            await cart.save();
    
            // Populate thông tin sản phẩm trước khi trả về
            await cart.populate('items.product');
    
            res.status(200).json({ message: "Đã thêm sản phẩm vào giỏ hàng", cart });
        } catch (error) {
            res.status(500).json({ message: "Lỗi server", error: error.message });
        }
        

    },
    removeItem: async (req, res) => {
        try {
            const { productId } = req.body;
            const userId = req.user.id;

            let cart = await Cart.findOne({ user: userId });

            if (!cart) {
                return res.status(404).json({ message: "Giỏ hàng không tồn tại" });
            }

            // Kiểm tra xem sản phẩm có trong giỏ hàng không
            const cartItemIndex = cart.items.findIndex(item =>
                item.product.toString() === productId
            );

            if (cartItemIndex > -1) {
                // Xóa sản phẩm khỏi giỏ hàng
                cart.items.splice(cartItemIndex, 1);

                // Cập nhật tổng giá
                cart.totalPrice = await cart.items.reduce(async (totalPromise, item) => {
                    const total = await totalPromise;
                    const product = await Product.findById(item.product);
                    return total + (item.quantity * product.price);
                }, Promise.resolve(0));

                // Lưu giỏ hàng
                await cart.save();

                // Populate thông tin sản phẩm trước khi trả về
                await cart.populate('items.product').execPopulate();

                res.status(200).json({ message: "Đã xóa sản phẩm khỏi giỏ hàng", cart });
            } else {
                res.status(404).json({ message: "Sản phẩm không tồn tại trong giỏ hàng" });
            }
        } catch (error) {
            res.status(500).json({ message: "Lỗi server", error: error.message });
        }
    },

    placeOrder: async (req, res) => {
        try {
            const { address } = req.body;
            const userId = req.user.id;

            let cart = await Cart.findOne({ user: userId }).populate('items.product');

            if (!cart) {
                return res.status(404).json({ message: "Giỏ hàng không tồn tại" });
            }

            let products = [];
            for (let i = 0; i < cart.items.length; i++) {
                let item = cart.items[i];
                let product = await Product.findById(item.product._id);
                if (product.quantity >= item.quantity) {
                    product.quantity -= item.quantity;
                    products.push({ product: item.product, quantity: item.quantity });
                    await product.save();
                } else {
                    return res.status(400).json({ message: `${product.name} is out of stock!` });
                }
            }

            // Xóa giỏ hàng sau khi đặt hàng
            await Cart.findOneAndDelete({ user: userId });

            let order = new Order({
                products,
                totalPrice: cart.totalPrice,
                address,
                userId,
                orderedAt: new Date().getTime(),
            });
            order = await order.save();
            res.status(200).json(order);
        } catch (error) {
            res.status(500).json({ message: "Lỗi server", error: error.message });
        }
    }
}
module.exports=cartController;