import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:work_os/inner_screens/profile.dart';

class AllWorkersWidget extends StatefulWidget {
  final String userID;
  final String userName;
  final String userEmail;
  final String positionInCompany;
  final String phoneNumber;
  final String userImageUrl;

  const AllWorkersWidget(
      {required this.userID,
      required this.userName,
      required this.userEmail,
      required this.positionInCompany,
      required this.phoneNumber,
      required this.userImageUrl});
  @override
  _AllWorkersWidgetState createState() => _AllWorkersWidgetState();
}

class _AllWorkersWidgetState extends State<AllWorkersWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileScreen(
                  userID: widget.userID,
                ),
              ),
            );
          },
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(width: 1.0),
              ),
            ),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 20,
              child: Image.network(widget.userImageUrl == null
                  ? 'https://cdn.icon-icons.com/icons2/2643/PNG/512/male_boy_person_people_avatar_icon_159358.png'
                  : widget.userImageUrl),
            ),
          ),
          title: Text(
            widget.userName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.linear_scale,
                color: Colors.pink.shade800,
              ),
              Text(
                '${widget.positionInCompany}/${widget.phoneNumber}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.mail_outline_outlined,
              size: 30,
              color: Colors.pink[800],
            ),
            onPressed: _mailTo,
          )),
    );
  }

  void _mailTo() async {
    print('widget.userEmail ${widget.userEmail}');
    var url = 'mailto:${widget.userEmail}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Error occured coulnd\'t open link';
    }
  }
}
