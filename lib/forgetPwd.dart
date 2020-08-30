import 'package:flutter/material.dart';

class ForgetPwd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ForgetState();
  }
}

class _ForgetState extends State<ForgetPwd> {
  String email = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leo Store'),
        backgroundColor: Colors.indigo[900],
      ),
      body: Center(
        child:Padding(padding: EdgeInsets.only(top:50,left:20,right:20),
        child:Column(
          children: <Widget>[
            Text('We will mail you a link ... Please click on that link to reset your password',
            style: TextStyle(color:Colors.indigo[500],fontSize: 20)),
            Theme(data: ThemeData(
              hintColor: Colors.indigo[500]
            ),
            child:Padding(padding: EdgeInsets.only(top:50,left:20,right:20), 
            child:TextFormField(
              validator:(value){
                if(value.isEmpty){
                  return "Please enter your email";
                }
                else{
                  email=value;
                }
                return null;
              },
              style: TextStyle(color:Colors.white),
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(15),
                  borderSide : BorderSide(color: Colors.indigo[400],width: 1)
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(15),
                  borderSide : BorderSide(color: Colors.indigo[400],width: 1)
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(15),
                  borderSide : BorderSide(color: Colors.indigo[400],width: 1)
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(15),
                  borderSide : BorderSide(color: Colors.indigo[400],width: 1)
                )
              ),
            ))
            ),
            Padding(padding: EdgeInsets.only(left:20,right:20),
            // child: RaisedButton(onPressed: (){
            //   if(_formKey.CurrentState.validate()){
            //     Future<String> check = LogIn();
            //     if(check!=null){
                  
            //     }
            //   }
            // }
            // ),
        )
          ],
        ))
      ),
    );
  }
}
