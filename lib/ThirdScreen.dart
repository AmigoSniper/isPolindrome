import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'getApi.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  List<Map<String, dynamic>> allUsers = [];
  List<Map<String, dynamic>> _foundUsers = [];
  bool isLoading = false;
  int page = 1;
  final Getapi api = Getapi();

  @override
  void initState() {
    super.initState();
    _getAllUser();
  }

  Future<void> _getAllUser() async {
    setState(() {
      isLoading = true;
    });

    try {
      Map<String, dynamic> response = await api.fetchUsers(page: page);
      List<Map<String, dynamic>> users =
          List<Map<String, dynamic>>.from(response['data']);

      print("Belum urut ${users}");

      setState(() {
        allUsers = List<Map<String, dynamic>>.from(users);
        _foundUsers = allUsers;
        _sortUsersByName();
        print(_foundUsers);
      });
    } catch (e) {
      print("Gagal bolo");
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _sortUsersByName() {
    _foundUsers.sort((a, b) => a['first_name'].compareTo(b['first_name']));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: Colors.blueGrey,
              height: 1.0,
            )),
        title: const Text(
          'Third Screen',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : _foundUsers.isEmpty
                ? Center(child: const Text("User Not Found"))
                : RefreshIndicator(
                    onRefresh: _getAllUser,
                    child: ListView.builder(
                        itemCount: _foundUsers.length,
                        itemBuilder: (context, index) {
                          final user = _foundUsers[index];
                          final userName =
                              '${user['first_name']} ${user['last_name']}';
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(user['avatar']),
                            ),
                            title: Text(userName),
                            subtitle: Text(user['email']),
                            onTap: () {
                              Navigator.pop(context, userName);
                            },
                          );
                        }),
                  ),
      ),
    );
  }
}
