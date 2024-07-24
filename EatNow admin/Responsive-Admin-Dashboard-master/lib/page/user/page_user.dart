import 'package:flutter/material.dart';
import 'package:responsive_admin_dashboard/constants/color_constants.dart';
import 'package:responsive_admin_dashboard/data/model/recent_user_model.dart';
import 'package:responsive_admin_dashboard/page/user/add_user_page.dart';
import 'package:responsive_admin_dashboard/utils/colorful_tag.dart';


// Trang RecentUsersPage
class RecentUsersPage extends StatelessWidget {
  const RecentUsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recent Users', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UserPage()),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(defaultPadding),
        child: Container(
          padding: EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Recent Users",
                style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.black),
              ),
              SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: DataTable(
                    horizontalMargin: 0,
                    columnSpacing: defaultPadding,
                    columns: [
                      DataColumn(
                        label: Text("Name Surname", style: TextStyle(color: Colors.black)),
                      ),
                      DataColumn(
                        label: Text("Role", style: TextStyle(color: Colors.black)),
                      ),
                      DataColumn(
                        label: Text("E-mail", style: TextStyle(color: Colors.black)),
                      ),
                      DataColumn(
                        label: Text("Registration Date", style: TextStyle(color: Colors.black)),
                      ),
                      DataColumn(
                        label: Text("Status", style: TextStyle(color: Colors.black)),
                      ),
                      DataColumn(
                        label: Text("Operation", style: TextStyle(color: Colors.black)),
                      ),
                    ],
                    rows: List.generate(
                      recentUsers.length,
                      (index) => recentUserDataRow(recentUsers[index], context),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget hiển thị dữ liệu recent user
DataRow recentUserDataRow(RecentUser userInfo, BuildContext context) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            // TextAvatar(
            //   size: 35,
            //   backgroundColor: Colors.grey[200]!,
            //   textColor: Colors.black,
            //   fontSize: 14,
            //   upperCase: true,
            //   numberLetters: 1,
            //   shape: Shape.Rectangle,
            //   text: userInfo.name!,
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(
                userInfo.name!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      DataCell(Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: getRoleColor(userInfo.role).withOpacity(.2),
            border: Border.all(color: getRoleColor(userInfo.role)),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Text(userInfo.role!, style: TextStyle(color: Colors.black)))),
      DataCell(Text(userInfo.email!, style: TextStyle(color: Colors.black))),
      DataCell(Text(userInfo.date!, style: TextStyle(color: Colors.black))),
      DataCell(Text(userInfo.posts!, style: TextStyle(color: Colors.black))),
      DataCell(
        Row(
          children: [
            TextButton(
              child: Text('View', style: TextStyle(color: greenColor)),
              onPressed: () {},
            ),
            SizedBox(
              width: 6,
            ),
            TextButton(
              child: Text("Delete", style: TextStyle(color: Colors.redAccent)),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                          title: Center(
                            child: Column(
                              children: [
                                Icon(Icons.warning_outlined,
                                    size: 36, color: Colors.red),
                                SizedBox(height: 20),
                                Text("Confirm Deletion", style: TextStyle(color: Colors.black)),
                              ],
                            ),
                          ),
                          content: Container(
                            color: Colors.white,
                            height: 70,
                            child: Column(
                              children: [
                                Text(
                                    "Are you sure want to delete '${userInfo.name}'?", style: TextStyle(color: Colors.black)),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton.icon(
                                        icon: Icon(
                                          Icons.close,
                                          size: 14,
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.grey),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        label: Text("Cancel")),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    ElevatedButton.icon(
                                        icon: Icon(
                                          Icons.delete,
                                          size: 14,
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red),
                                        onPressed: () {},
                                        label: Text("Delete"))
                                  ],
                                )
                              ],
                            ),
                          ));
                    });
              },
              // Delete
            ),
          ],
        ),
      ),
    ],
  );
}
