const User = require('../models/user');

const adminController = {
    // Hiển thị danh sách người dùng
    getAllUsers: async (req, res) => {
        try {
            const users = await User.find();
            res.render('admin/users', { users });
        } catch (err) {
            res.status(500).send("Lỗi máy chủ");
        }
    },

    // Xóa người dùng
    deleteUser: async (req, res) => {
        try {
            await User.findByIdAndDelete(req.params.id);
            res.redirect('/admin/users');
        } catch (err) {
            res.status(500).send("Lỗi máy chủ");
        }
    }
};

module.exports = adminController;
