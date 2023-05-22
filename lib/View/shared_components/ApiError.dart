import 'package:flutter/material.dart';

class ApiErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback retryCallback;

  const ApiErrorWidget({
    Key? key,
    required this.message,
    required this.retryCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message ?? 'Error occurred while loading data.',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Icon(Icons.signal_wifi_statusbar_connected_no_internet_4_outlined,
            color:  Color.fromRGBO(229, 229, 229, 1),
            size: 250,
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (states) => Color.fromRGBO(12, 62, 117, 1),
              ),

            ),
            onPressed: retryCallback,
            child: Text('Retry'),
          ),

        //  Image.asset("assets/noConnection.png")
        ],
      ),
    );
  }
}
