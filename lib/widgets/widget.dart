import 'package:day_tracker/Screens/viewDisplay.dart';
import 'package:day_tracker/functions/functions.dart';
import 'package:day_tracker/models/models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Container customText(
    {required String hintText, required TextEditingController controller}) {
  return Container(
    width: 300,
    height: 52,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: const Color.fromARGB(255, 249, 249, 249),
    ),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(0, 255, 252, 252),
        hintText: hintText,
        border: InputBorder.none,
      ),
    ),
  );
}
 Widget buildMyDatas(List<MyDatas> datas){
     return datas.isEmpty ? Center(
      child: Text('Add New Fields'),
     ):ListView.builder(
      itemCount: datas.length,
      itemBuilder: (context,index){
        final val=datas[index];

        return ListTile(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (ctx)=>MyView(category: val.category.toString() , timeSpend: val.timeSpend.toString(), dateAndTime: val.dateAndTime.toString(), description: val.description.toString())));
          },
          title: Text(val.category.toString()),
          trailing:IconButton(onPressed: (){
            deleteData(index);
          }, icon: Icon(Icons.delete)) ,
        );
        
        
      }
      
      );
 }