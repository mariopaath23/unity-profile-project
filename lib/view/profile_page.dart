import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../theme.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  
  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>{
  Future<Data> getUserData() async{
    final response = await http.get(
      Uri.parse('https://reqres.in/api/users/2')
      );

      if (response.statusCode == 200){
        final body = jsonDecode(response.body);
        Data userData = UserModel.fromJson(body).data;
        return userData;
      }
      else{
        throw 'Error!';
      }
  }
  late Future<Data> user;

  @override
  void initState(){
    super.initState();
    user = getUserData();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/Gradient-Background-Wallpaper-002.jpg',
                ),
                fit: BoxFit.cover),
          ),
        ),
        FutureBuilder(future: user, builder: (ctx, snapshot){
          var connectionState = snapshot.connectionState;
          if(connectionState == ConnectionState.none){
            return const Text('Sedang Offline');
          }
          else if(connectionState == ConnectionState.waiting){
            return const CircularProgressIndicator();
          }
          else if(connectionState == ConnectionState.done){
            if(snapshot.hasData){
              return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 55,
                backgroundImage: NetworkImage(snapshot.data!.avatar),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '${snapshot.data!.firstName} ${snapshot.data!.lastName}',
                style: titleTextStyle.copyWith(
                    letterSpacing: 2,
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Not So Senior Flutter Developer',
                style: titleTextStyle.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(snapshot.detail.email)
            ],
          ),
        )
            }
          }
          return const Center(child: Text('No Data'));
        })
      ],
    );
  }
}