import 'package:flighttracker/cbits/flightdata_cubit.dart';
import 'package:flighttracker/constants/icons.dart';
import 'package:flighttracker/constants/textformates.dart';
import 'package:flighttracker/constants/textsize.dart';
import 'package:flighttracker/model/flightmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController _flightNumberController = TextEditingController();
  String _flightNum = "";
  @override
  Widget build(BuildContext context) {
    final getercubitflight = context.read<FlightdataCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/flight_tracker_logo.png',
          height: 100,
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          // Allows scrolling when content overflows
          child: Column(
            children: [
              // Header Section
              const Text(
                "Flight Tracker",
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Real-time flight information and prediction",
                style: TextStyle(color: Colors.grey, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const Divider(
                color: Colors.green,
                thickness: 2,
                indent: 10,
                endIndent: 10,
              ),
              const SizedBox(height: 16),

              // Flight Tracking Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade300, blurRadius: 8),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Track Flight",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Enter the flight number to track a flight",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        // TextField
                        Expanded(
                          child: TextField(
                            // controller: _flightNumberController,
                            // onChanged: (value) {
                            //   getercubitflight.fetchFlightData(value);
                            // },
                            onChanged: (value) {
                              setState(() {
                                _flightNum = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: "Enter flight number",
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 14),
                            ),
                            // onChanged: (value){},
                          ),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: _flightNum.isNotEmpty
                              ? () {
                                  context
                                      .read<FlightdataCubit>()
                                      .fetchFlightData(_flightNum);
                                  //clear
                                  // _flightNumberController.clear();
                                  // setState(() {
                                  //   _flightNum = '';
                                  // });
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            backgroundColor: Colors.green,
                            textStyle: const TextStyle(
                                fontSize: 16), // Button background color
                          ),
                          child: const Text(
                            "Track Flight",
                            style: TextStyle(color: Colors.white),
                          ),
                        )

                        ///

                        ///
                        // Track Flight Button
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Oncoming Flights Section
              Container(
                width: double.infinity,
                height: 250,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Oncoming Flight",
                      style: AppTextStyles.heading,
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Flight details here",
                      style: AppTextStyles.body,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("from", style: AppTextStyles.body),
                          Text("To", style: AppTextStyles.body),
                        ]),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Progress",
                          style: AppTextStyles.body,
                        ),
                        // const LinearProgressIndicator(
                        //   valueColor: AlwaysStoppedAnimation<Color>(
                        //       Colors.white), // White color for progress bar
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              BlocBuilder<FlightdataCubit, FlightdataState>(
                  builder: (context, state) {
                if (State is flightDataLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is flightDataLoaded) {
                  if ((state.flightdata.data ?? []).isNotEmpty) {
                    return _FligtDetailsCard(state.flightdata);
                  }
                } else if (state is flightdataError) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          state.error,
                          style: const TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.red,
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  });
                  return const SizedBox(); // Optionally return an empty widget
                }

                return SizedBox();
              })

              // Your Flight Section
            ],
          ),
        ),
      ),
    );
  }
}

Widget _FligtDetailsCard(FlightDetails flightData) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.green.shade800,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Your Flight",
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
        // const SizedBox(height: 8),
        Text(
          "Flight Number: ${flightData.data?.first.flight?.iata ?? "N/A"}",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        IconandText(
            icon: Icons.flight,
            text:
                "Tail Number:${flightData.data?.first.flight?.icao ?? "N/A"}"),
        FromToTextRow(
            fromText:
                "From:${flightData.data?.first.departure?.airport ?? "N/A"}",
            toText: "To: ${flightData.data?.first.arrival?.airport ?? "N/A"}"),
        IconRow(items: [
          IconWithText(
              icon: Icons.calendar_today, text: "Scheduled Departure:"),
          IconWithText(icon: Icons.schedule, text: "Estimated:"),
        ]),
        IconRow(items: [
          IconWithText(icon: Icons.calendar_today, text: "Scheduled Arrival:"),
          IconWithText(icon: Icons.calendar_today, text: "Estimated:")
        ]),
        Text(
          "Status: ${flightData.data?.first.flightStatus ?? "N/A"}",
          style: const TextStyle(color: Colors.white),
        ),
      ],
    ),
  );
}
