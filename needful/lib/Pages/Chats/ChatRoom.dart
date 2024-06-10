import 'package:flutter/material.dart';
import 'package:needful/Utils/color_use.dart';
import 'package:needful/Utils/text_use.dart';
import 'package:needful/widgets/chat_bubble.dart';
import 'package:needful/widgets/text_form.dart';
import 'package:needful/widgets/title_bar.dart';

class ChatRoom extends StatefulWidget {
  final int messageUserId;
  final int userId;
  final String messageUsername;

  const ChatRoom({super.key, required this.messageUserId, required this.userId, required this.messageUsername});

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  bool _isButtonPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorUse.backgroundColor,
      appBar: CustomAppBarPop(
        backgroundColor: colorUse.primaryColor,
        title: 'Chat',
        centerTitle: true,
      ),
      body: Column(
        children: [
          Flexible( // UserInfo part
            flex: 1,
            fit: FlexFit.loose,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.messageUsername,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  // const Icon(Icons.more_horiz)
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            // fit: FlexFit.tight,
            child: ChatBubble(
              userId: widget.userId,
              messageUserId: widget.messageUserId,
              messageUsername: widget.messageUsername,
            ),
          ),
          // Fixed bottom input area
          Padding(
            padding: EdgeInsets.all(2),
            child: Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Container( // Wrap input area in a Container
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  children: [
                    ElevatedButton(
                      child: _isButtonPressed ? Text('Complete transaction',style: TextStyle(color: const Color(0xFF000000))) 
                                              : Text('Transaction ready',style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isButtonPressed ? colorUse.accent : colorUse.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                        )
                      ),
                      onPressed: () {
                        setState(() {
                          _isButtonPressed = !_isButtonPressed; // Toggle the pressed state
                        });
                      },
                    ),
                    TextForm(
                      decorationAsSendIcon: true,
                      label: 'Start Typing...',
                      filled: true,
                      maxLine: 1,
                    ),
                  ],
                ),
              ),
            ),
          ), 
        ],
      ),
    );
  }
}