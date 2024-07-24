
import 'package:responsive_admin_dashboard/constants/constants.dart';
import 'package:responsive_admin_dashboard/models/analytic_info_model.dart';
import 'package:responsive_admin_dashboard/models/discussions_info_model.dart';
import 'package:responsive_admin_dashboard/models/referal_info_model.dart';

List analyticData = [
  AnalyticInfo(
    title: "Subscribers",
    count: 720,
    svgSrc: "assets/icons/Subscribers.svg",
    color: primaryColor,
  ),
  AnalyticInfo(
    title: "Post",
    count: 820,
    svgSrc: "assets/icons/Post.svg",
    color: purple,
  ),
  AnalyticInfo(
    title: "Pages",
    count: 920,
    svgSrc: "assets/icons/Pages.svg",
    color: orange,
  ),
  AnalyticInfo(
    title: "Comments",
    count: 920,
    svgSrc: "assets/icons/Comments.svg",
    color: green,
  ),
];

List discussionData = [
  DiscussionInfoModel(
    imageSrc: "assets/images/photo1.jpg",
    name: "Quốc Thái",
    date: "Jan 01,2024",
  ),
  DiscussionInfoModel(
    imageSrc: "assets/images/photo2.jpg",
    name: "Anh Khoa",
    date: "Sep 12,2024",
  ),
  DiscussionInfoModel(
    imageSrc: "assets/images/photo3.jpg",
    name: "Đăng Huy",
    date: "May 27,2024",
  ),
  DiscussionInfoModel(
    imageSrc: "assets/images/photo4.jpg",
    name: "Thiên Phúc",
    date: "Octo 25,2024",
  ),
  DiscussionInfoModel(
    imageSrc: "assets/images/photo5.jpg",
    name: "Tấn Hiếu",
    date: "Feb 09,2024",
  ),
  DiscussionInfoModel(
    imageSrc: "assets/images/photo1.jpg",
    name: "Phát Tài",
    date: "Nov 07,2024",
  ),
];

List referalData = [
  ReferalInfoModel(
    title: "Facebook",
    count: 234,
    svgSrc: "assets/icons/Facebook.svg",
    color: primaryColor,
  ),
  ReferalInfoModel(
    title: "Twitter",
    count: 234,
    svgSrc: "assets/icons/Twitter.svg",
    color: primaryColor,
  ),
  ReferalInfoModel(
    title: "Linkedin",
    count: 234,
    svgSrc: "assets/icons/Linkedin.svg",
    color: primaryColor,
  ),

  ReferalInfoModel(
    title: "Dribble",
    count: 234,
    svgSrc: "assets/icons/Dribbble.svg",
    color: red,
  ),
];
