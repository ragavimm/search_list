import 'package:flutter/material.dart';

class SearchList extends StatefulWidget {
  const SearchList({super.key});

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {

  // var fruit =["apple","orange","grapes"];
   var fruit=[{
     "id":1,
     "name":"apple",
     "data":{
       'quantity':10,
        "location":[
          "ooty","coimbatore"
        ]
     }
   },{"id":2,"name":"orange","data":{
     'quantity':20,"location":[
       "ooty"
     ]
   }},{"id":3,"name":"avocado","data":{
     'quantity':15,"location":[
       "salem","erode"
     ]
   }},{"id":4,"name":"cherry","data":{
     'quantity':3,"location":[
       "coimbatore"
     ]
   }}];
  var temp =[];
  var val="";

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero,(){
      for (int i=0;i<fruit.length;i++) {
        setState(() {
          fruit[i].addAll({"show":false});
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    if(val.isNotEmpty){
      temp=fruit.where((e) => e["name"].toString().toLowerCase().contains(val.toLowerCase())).toList();
    }else{
      temp=fruit;
    }

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [

            TextField(
              onChanged: (e){

                setState(() {
                  val=e;
                });

              },
              decoration: InputDecoration(
                hintText: "search"
              ),
            ),

            Expanded(child:ListView.builder(
              itemCount: temp.length,
                shrinkWrap: true,
                itemBuilder: (c,i){

                var list =temp[i]["data"]['location'] as List;
                var show =fruit[i]["show"] as bool;

                  return ListTile(
                    onTap: (){
                      setState(() {
                        fruit[i]["show"]=!show;
                        // fruit.removeWhere((element) => element["name"]==temp[i]["name"]);
                        // temp=fruit;
                      });
                    },
                    title: Text("${temp[i]["name"]}"),
                    trailing: Text("${temp[i]["data"]['quantity']}"),
                    tileColor: fruit[i]["show"]==true?Colors.cyanAccent:Colors.white,
                    subtitle: Wrap(
                      spacing: 5,
                      children:[
                        for(var item in list)
                          Text(item)
                      ]
                    ),
                    leading: CircleAvatar(
                      child: Text("${temp[i]["name"][0].toString().toUpperCase()}"),
                    ),
                  );
                }
            ))

          ],
        ),
      ),
    );
  }
}

