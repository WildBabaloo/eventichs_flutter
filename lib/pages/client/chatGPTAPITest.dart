import 'dart:convert';

import 'package:eventichs_flutter/entities/ResponseModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatGPTAPITest extends StatefulWidget {
  const ChatGPTAPITest({super.key});

  @override
  State<StatefulWidget> createState() => _ChatGPTAPITestState();

}

class _ChatGPTAPITestState extends State<ChatGPTAPITest> {
  late final TextEditingController promptController;
  String responsetxt = '';
  late ResponseModel _responseModel;

  @override
  void initState() {
    promptController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    promptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PromptBuilder(responseTxt: responsetxt),
          TextFormFieldBuilder(
            promptController: promptController, btnFun: completionFun
          ),
        ],
      ),
    );
  }

  completionFun() async {
    setState(() => responsetxt = "Loading...");

    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer INSERT OPENAPIKEY HERE'
      },
      body: jsonEncode(
        {
          "model": "gpt-3.5-turbo-instruct",
          "prompt": promptController.text,
          "max_tokens": 250,
          "temperature": 0.2,
          "top_p": 1,
        }
      )
    );

    setState(() {
      print(response.body);
      _responseModel = ResponseModel.fromJson(response.body);
      responsetxt = _responseModel.choices[0]['text'];
      debugPrint(responsetxt);
    });
  }
}

class PromptBuilder extends StatelessWidget {
  const PromptBuilder({super.key, required this.responseTxt});
  final String responseTxt;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.35,
      color: const Color(0xff434654),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Text(
              responseTxt,
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class TextFormFieldBuilder extends StatelessWidget {
    const TextFormFieldBuilder({super.key, required this.promptController, required this.btnFun});
    final TextEditingController promptController;
    final Function btnFun;
    
      @override
      Widget build(BuildContext context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 50),
            child: Row(
              children: [
                Flexible(child: TextFormField(
                  cursorColor: Colors.white,
                  controller: promptController,
                  autofocus: true,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xff444653),
                      ),
                      borderRadius: BorderRadius.circular(5.5),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff444635),
                      ),
                    ),
                    filled: true,
                    fillColor: const Color(0xff444653),
                    hintText: 'Ask me anything!',
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                )),
                Container(
                  color: const Color(0xff19bc99),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: IconButton(
                      onPressed: () => btnFun(),
                      icon: const Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }
}