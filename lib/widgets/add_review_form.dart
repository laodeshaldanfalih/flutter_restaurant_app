import 'package:flutter/material.dart';

void addReview(context, TextEditingController myController1,
    TextEditingController myController2) {
  String name, review;
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 50,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              formContainer(myController1),
              formContainer(myController2),
              SizedBox(
                height: 40,
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    name = myController1.text;
                    review = myController2.text;
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  child: const Text('Submit'),
                ),
              )
            ],
          ),
        );
      });
}

Widget formContainer(TextEditingController myController) {
  return Container(
    width: 280,
    height: 50,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50), border: Border.all(width: 1)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 200,
          child: TextField(
            textInputAction: TextInputAction.search,
            onSubmitted: (value) {},
            controller: myController,
            cursorColor: Colors.black,
            autocorrect: true,
            decoration: const InputDecoration(
              hintText: 'Restaurant, foods, drinks',
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                borderSide: BorderSide(color: Colors.transparent),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
