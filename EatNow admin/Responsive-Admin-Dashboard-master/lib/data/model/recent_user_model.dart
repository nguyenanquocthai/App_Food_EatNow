class RecentUser {
  final String? icon, name, date, posts, role, email;

  RecentUser(
      {this.icon, this.name, this.date, this.posts, this.role, this.email});
}

List recentUsers = [
  RecentUser(
    icon: "assets/icons/xd_file.svg",
    name: "Admin QuocThai",
    role: "Admin",
    email: "quocthai@hoon.com",
    date: "01-07-2024",
    posts: "4",
  ),
  RecentUser(
    icon: "assets/icons/Figma_file.svg",
    name: "DangHUY",
    role: "User",
    email: "danghuy@gmail.com",
    date: "27-07-2024",
    posts: "19",
  ),
  RecentUser(
    icon: "assets/icons/doc_file.svg",
    name: "AnhKhoa",
    role: "User",
    email: "khoapub@google.com",
    date: "23-07-2024",
    posts: "32",
  ),
  RecentUser(
    icon: "assets/icons/sound_file.svg",
    name: "PhucBeo",
    role: "User",
    email: "thienphuc@google.com",
    date: "21-02-2021",
    posts: "3",
  ),
  RecentUser(
    icon: "assets/icons/media_file.svg",
    name: "PhatTai",
    role: "User",
    email: "phattai@google.com",
    date: "23-02-2021",
    posts: "2",
  ),
  RecentUser(
    icon: "assets/icons/pdf_file.svg",
    name: "TanHieu",
    role: "User",
    email: "tanheu@google.com",
    date: "25-07-2024",
    posts: "3",
  ),
  RecentUser(
    icon: "assets/icons/excle_file.svg",
    name: "NgocAnhh",
    role: "User",
    email: "ngocanh@gmail.com",
    date: "25-07-2024",
    posts: "34",
  ),
];
