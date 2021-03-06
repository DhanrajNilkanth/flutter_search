import 'package:flutter/material.dart';
import 'package:flutter_search/contacts.dart';
import 'package:search_page/search_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DemoApp(),
      theme: ThemeData.dark(),
    );
  }
}

class DemoApp extends StatelessWidget {

 static List<Contact> contact = [

   Contact('MKBHD', '99248232423', '7:12'),
   Contact('SuperSaf', '9924223423', '6:12'),
   Contact('TECHNICAL GURUJI', '9248232423', '8:00'),
   Contact('BB KI VINE', '9923232323', '9:12'),
   Contact('BIGG BOSS', '99248232423', '1:12'),
   Contact('SANTA BROTHER', '99248232423', '4:15'),

 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Contact'),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () => showSearch(
                  context: context,
                  delegate: SearchPage<Contact>(
                    searchLabel: 'Search Contact',
                      suggestion: Center(
                        child: Container(
                          height: 400,
                          width: 350,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/contact.png'),
                              fit: BoxFit.fill,
                            )
                          ),
                        ),
                      ),
                      builder: (contact)=> ListTile(
                        title: Text(contact.name),
                        subtitle: Text(contact.mobile),
                        trailing: Text(contact.time),
                      ),
                      filter: (contact) => [
                        contact.name,
                        contact.mobile,
                        contact.time,
                      ],
                      items: contact,
                    failure: Center(
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/search_again.png'),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                    )
                  )
              ),
          )
        ],
      ),
      body: ListView.builder(

          itemCount: contact.length,
          itemBuilder: (context, index){
            final Contact contacts = contact[index];
            return ListTile(
              title: Text(contacts.name),
              subtitle: Text(contacts.mobile),
              trailing: Text(contacts.time),
            );
          }
      ),
    );
  }
}















