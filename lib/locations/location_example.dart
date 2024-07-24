import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationExample extends StatefulWidget {
  const LocationExample({super.key});

  @override
  State<LocationExample> createState() => _LocationExampleState();
}

class _LocationExampleState extends State<LocationExample> {
  final String _url = 'https://github.com/misbahazmi/flutter-basics';

  final Location location = Location();

  Future<void> _showInfoDialog() {
    return showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Location Application'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text('Created by Misbah'),
                InkWell(
                  child: Text(
                    _url,
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () => launchUrl(Uri.parse(_url)),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  LocationData? _location;
  StreamSubscription<LocationData>? _locationSubscription;
  String? _error;

  Future<void> _listenLocation() async {
    _locationSubscription =
        location.onLocationChanged.handleError((dynamic err) {
      if (err is PlatformException) {
        setState(() {
          _error = err.code;
        });
      }
      _locationSubscription?.cancel();
      setState(() {
        _locationSubscription = null;
      });
    }).listen((currentLocation) {
      setState(() {
        _error = null;

        _location = currentLocation;
      });
    });
    setState(() {});
  }

  Future<void> _stopListen() async {
    await _locationSubscription?.cancel();
    setState(() {
      _locationSubscription = null;
    });
  }

  @override
  void dispose() {
    _locationSubscription?.cancel();
    setState(() {
      _locationSubscription = null;
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Demo'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: _showInfoDialog,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Listen location: ${_error ?? '${_location ?? "unknown"}'}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(right: 42),
                    child: ElevatedButton(
                      onPressed: _locationSubscription == null
                          ? _listenLocation
                          : null,
                      child: const Text('Listen'),
                    ),
                  ),
                  ElevatedButton(
                    onPressed:
                        _locationSubscription != null ? _stopListen : null,
                    child: const Text('Stop'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
