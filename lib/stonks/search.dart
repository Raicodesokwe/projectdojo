import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectdojo/alpaca/assets.dart';
import 'package:projectdojo/alpaca/trading.dart';

class SearchStonk extends StatefulWidget {
  SearchStonk({Key key}) : super(key: key);

  @override
  State<SearchStonk> createState() => _SearchStonkState();
}

class _SearchStonkState extends State<SearchStonk> {
  List<Assets> ulist = [];
  List<Assets> userLists = [];
  bool isLoading = false;
  Future tak() async {
    setState(() {
      isLoading = true;
    });
    await TradingService().getAssets().then((value) {
      setState(() {
        ulist = value;
        userLists = ulist;
      });
    });
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tak();
  }

  final _debouncer = Debouncer();
  TextEditingController _controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Container(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        controller: _controller,
                        textInputAction: TextInputAction.search,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                            suffixIcon: InkWell(
                              child: Icon(Icons.search),
                            ),
                            contentPadding: EdgeInsets.all(15.0),
                            hintText: 'Search '),
                        onChanged: (string) {
                          _debouncer.run(() {
                            setState(() {
                              userLists = ulist
                                  .where(
                                    (u) => (u.symbol.toLowerCase().contains(
                                          string.toLowerCase(),
                                        )),
                                  )
                                  .toList();
                            });
                          });
                        },
                      )),
                  Expanded(
                    child: _controller.text.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            padding: EdgeInsets.all(5),
                            itemCount: userLists.length,
                            itemBuilder: (context, index) {
                              return Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: BorderSide(
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 4),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: 54.0,
                                              width: 54.0,
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                      colors: [
                                                        const Color(0xff23b6e6),
                                                        const Color(0xff02d39a),
                                                        const Color(0xFFFEC18A)
                                                      ]),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0)),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10.0,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 200,
                                                child: Text(
                                                  userLists[index].name,
                                                  overflow: TextOverflow.fade,
                                                  style: GoogleFonts
                                                      .bigShouldersText(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20),
                                                ),
                                              ),
                                              Text(
                                                userLists[index].symbol,
                                                style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    fontWeight: FontWeight.w100,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  )

                                  //  Padding(
                                  //   padding: EdgeInsets.all(5.0),
                                  //   child: Column(
                                  //     mainAxisAlignment: MainAxisAlignment.start,
                                  //     crossAxisAlignment: CrossAxisAlignment.start,
                                  //     children: <Widget>[
                                  //       ListTile(
                                  //         title: Text(
                                  //           userLists[index].symbol,
                                  //           style: TextStyle(fontSize: 16),
                                  //         ),
                                  //       )
                                  //     ],
                                  //   ),
                                  // )
                                  );
                            })
                        : Container(),
                  )
                ],
              ));
  }
}
