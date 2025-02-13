import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  bool _isUploading = false;

  Future<void> _uploadPost() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isUploading = true);
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        String postId = FirebaseFirestore.instance.collection('posts').doc().id;

        await FirebaseFirestore.instance.collection('posts').doc(postId).set({
          'postId': postId,
          'userId': user.uid,
          'title': _titleController.text.trim(),
          'category': _categoryController.text.trim(),
          'description': _descriptionController.text.trim(),
          'date': FieldValue.serverTimestamp(),
          'likes': 0,
        });

        Fluttertoast.showToast(
            msg: "Post uploaded successfully",
            backgroundColor: const Color.fromARGB(255, 145, 145, 145));

        _titleController.clear();
        _categoryController.clear();
        _descriptionController.clear();
      } else {
        Fluttertoast.showToast(
            msg: "User not logged in", backgroundColor: Colors.redAccent);
      }

      setState(() => _isUploading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(1, 8, 12, 1),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Upload Post",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  buildTextField("Post Title", _titleController),
                  buildTextField("Category", _categoryController),
                  buildTextField("Description", _descriptionController,
                      maxLines: 3),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _isUploading ? null : _uploadPost,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(35, 179, 83, 1),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: _isUploading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            "Upload Post",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller,
      {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white70),
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromRGBO(239, 214, 172, 1)),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromRGBO(239, 214, 172, 1), width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (value) =>
            value == null || value.isEmpty ? "Please enter $label" : null,
      ),
    );
  }
}
