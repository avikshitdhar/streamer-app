import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_streaming_app/providers/user_provider.dart';
import 'package:video_streaming_app/resources/firestore_methods.dart';
import 'package:video_streaming_app/widgets/custom_textfield.dart';
import 'package:video_streaming_app/widgets/loading_indicator.dart';

class Chat extends StatefulWidget {
  final String channelId;
  const Chat({super.key, required this.channelId});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final TextEditingController _chatController = TextEditingController();

  @override
  void dispose() {
    _chatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: StreamBuilder<dynamic>(
              stream: FirebaseFirestore.instance
                  .collection('livestream')
                  .doc(widget.channelId)
                  .collection('comments')
                  .orderBy('createdAt', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const LoadingIndicator();
                }
                return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      snapshot.data.docs[index]['username'],
                      style: TextStyle(
                          color: snapshot.data.docs[index]['uid'] ==
                                  userProvider.user.uid
                              ? Colors.blue
                              : Colors.black),
                    ),
                    subtitle: Text(
                      snapshot.data.docs[index]['message'],
                    ),
                  ),
                );
              },
            ),
          ),
          CustomTextfield(
            controller: _chatController,
            onTap: (val) {
              FirestoreMethods().chat(
                _chatController.text,
                widget.channelId,
                context,
              );
              setState(() {
                _chatController.text = "";
              });
            },
          )
        ],
      ),
    );
  }
}
