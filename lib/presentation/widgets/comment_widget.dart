import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class Comment {
  final String userName;
  final String commentText;

  Comment({required this.userName, required this.commentText});
}

class CommentSection extends StatefulWidget {
  const CommentSection({super.key});

  @override
  State<CommentSection> createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool _isSignedIn = false;
  final TextEditingController _commentController = TextEditingController();
  final List<Comment> _comments = [
    Comment(userName: 'User1', commentText: 'This is a dummy comment 1'),
    Comment(userName: 'User2', commentText: 'This is a dummy comment 2'),
    Comment(userName: 'User3', commentText: 'This is a dummy comment 3'),
  ];

  @override
  void initState() {
    super.initState();
    // _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
    //   setState(() {
    //     _isSignedIn = account != null;
    //   });
    // });
    // _googleSignIn.signInSilently();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (!_isSignedIn)
          MaterialButton(
            onPressed: _signInWithGoogle,
            height: 50,
            minWidth: 100,
            color: Colors.red,
            child: const Text(
              'Google Signin',
              style: TextStyle(color: Colors.white),
            ),
          ),
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              // backgroundImage: _isSignedIn ? NetworkImage(_googleSignIn.currentUser!.photoUrl ?? '') : null,
              child: _isSignedIn ? null : const Icon(Icons.account_circle, size: 40),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: _commentController,
                decoration: const InputDecoration(
                  hintText: 'Write a comment...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              onPressed: _isSignedIn ? _sendComment : null,
              icon: const Icon(Icons.send),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: _comments.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_comments[index].userName),
                subtitle: Text(_comments[index].commentText),
              );
            },
          ),
        ),
      ],
    );
  }

  void _signInWithGoogle() async {
    try {
      // await _googleSignIn.signIn();
    } catch (error) {
      print('Error signing in: $error');
    }
  }

  void _sendComment() {
    final String commentText = _commentController.text.trim();
    if (commentText.isNotEmpty) {
      setState(() {
        // _comments
        //     .add(Comment(userName: _googleSignIn.currentUser!.displayName ?? 'Anonymous', commentText: commentText));
        _commentController.clear();
      });
    }
  }
}
