import 'package:flutter/material.dart';
import 'dart:async';
import 'services.dart';
import './models/accounts.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});
  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(microseconds: milliseconds), action);
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final debouncer = Debouncer(milliseconds: 1000);
  Accounts accounts;
  String title;

  @override
  void initState() {
    super.initState();
    title = 'Loading users..';
    accounts = Accounts();
    Services.getAccounts().then((accountsFromServer) {
      setState(() {
        accounts = accountsFromServer;
        title = widget.title;
      });
    });
  }

  Widget list() {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return row(index);
        },
        itemCount: accounts.accounts == null ? 0 : accounts.accounts.length,
      ),
    );
  }

  Widget row(int index) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListTile(
          leading: CircleAvatar(
             radius: 30,
              child: Padding(
            padding: const EdgeInsets.all(10),
             child: FittedBox(
            child: Image.asset(accounts.accounts[index].avatar),
          ),
              ),
          ),
          title: Text(
            accounts.accounts[index].fullName,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            accounts.accounts[index].gender,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  Widget searchF() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            5.0,
          ),
        ),
        filled: true,
        fillColor: Colors.white54,
        contentPadding: EdgeInsets.all(15.0),
        hintText: 'Filter by name or gender',
      ),
      onChanged: (string) {
        debouncer.run(() {
          setState(() {
            title = 'searching ...';
          });
          Services.getAccounts().then((accountsFromServer) {
            setState(() {
              accounts = Accounts.filterList(accountsFromServer, string);
              title = widget.title;
            });
          });
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            searchF(),
            SizedBox(height: 10.0),
            list(),
          ],
        ),
      ),
    );
  }
}
