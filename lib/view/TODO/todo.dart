import 'package:flutter/material.dart';

class MyTodoApp extends StatefulWidget {
  const MyTodoApp({super.key});

  @override
  State<MyTodoApp> createState() => _MyTodoAppState();
}

class _MyTodoAppState extends State<MyTodoApp> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _list = [];
  void clearText() {
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.grid_view_rounded),
          ),
          title: const Text(
            "To-Do List",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: _list.length,
              itemBuilder: (context, index) => Center(
                      child: Text(
                    _list[index],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ))),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton.extended(
                onPressed: () {
                  setState(() {
                    _list.clear();
                  });
                },
                label: const Text("Clear"),
              ),
              FloatingActionButton.extended(
                  onPressed: () {
                    showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(45),
                            topLeft: Radius.circular(45),
                          ),
                        ),
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width,
                              height: MediaQuery.sizeOf(context).height / 6,
                              decoration: const BoxDecoration(
                                color: Colors.pink,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(45),
                                  topLeft: Radius.circular(45),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: TextField(
                                      controller: _controller,
                                      cursorColor: Colors.black,
                                      showCursor: true,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                      decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 10,
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          hintText: 'Enter Your List Here...',
                                          hintStyle: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            borderSide: BorderSide.none,
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            borderSide: BorderSide.none,
                                          ),
                                          suffixIcon: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  _list.add(_controller.text);
                                                });
                                                clearText();
                                                FocusScope.of(context)
                                                    .unfocus();
                                              },
                                              icon: const Icon(
                                                Icons.add,
                                                color: Colors.black,
                                              ))),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  label: const Text("Add List")),
            ],
          ),
        ),
      ),
    );
  }
}
