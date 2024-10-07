import 'package:home_roti_login_new/header.dart';

class OtpEnter extends StatefulWidget {
  const OtpEnter({super.key});

  @override
  State<OtpEnter> createState() => _OtpEnterState();
}

List<TextEditingController> _controllers =
    List.generate(4, (index) => TextEditingController());

List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
final _otpPinFieldController = GlobalKey<OtpPinFieldState>();

class _OtpEnterState extends State<OtpEnter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Opacity(
              opacity: 0.07,
              child: Image.asset(
                'lib/assets/images/image.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(
                MediaQuery.of(context).size.height * 0.02), // Scaled padding
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MySizeBox(MediaQuery.of(context).size.height * 0.05, null),

                  // Back Button
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Image.asset(
                      "lib/assets/images/backbutton.png",
                      height: MediaQuery.of(context).size.height * 0.02,
                      color: const Color(0xff030712),
                    ),
                  ),

                  MySizeBox(MediaQuery.of(context).size.height * 0.03, null),

                  // Login heading
                  Text(
                    'Mobile Number Verification',
                    style: GoogleFonts.roboto(
                      fontSize: MediaQuery.of(context).size.height * 0.03,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff1F493D),
                    ),
                  ),

                  MySizeBox(MediaQuery.of(context).size.height * 0.03, null),

                  // Send OTP text
                  Text(
                    'Enter the OTP sent to 7041341116',
                    style: GoogleFonts.openSans(
                      fontSize: MediaQuery.of(context).size.height * 0.025,
                      fontWeight: FontWeight.normal,
                      color: const Color(0xff1F2937),
                    ),
                  ),

                  MySizeBox(MediaQuery.of(context).size.height * 0.05, null),

                  // OTP field
                  OtpPinField(
                    key: _otpPinFieldController,
                    autoFillEnable: false,
                    textInputAction: TextInputAction.done,
                    onSubmit: (text) {
                      print('Entered pin is $text');
                    },
                    onChange: (text) {
                      print('Enter on change pin is $text');
                    },
                    onCodeChanged: (code) {
                      print('onCodeChanged  is $code');
                    },
                    fieldHeight: MediaQuery.of(context).size.height * 0.08,
                    fieldWidth: MediaQuery.of(context).size.width * 0.15,
                    otpPinFieldStyle: OtpPinFieldStyle(
                      textStyle: GoogleFonts.openSans(
                        color: const Color(0xff374151),
                        fontSize: MediaQuery.of(context).size.height * 0.04,
                        fontWeight: FontWeight.w100,
                      ),
                      activeFieldBorderColor: const Color(0xffD1D5DB),
                      defaultFieldBorderColor: const Color(0xffD1D5DB),
                    ),
                    cursorColor: const Color(0xff374151),
                    maxLength: 4,
                    showCursor: true,
                    mainAxisAlignment: MainAxisAlignment.center,
                    otpPinFieldDecoration:
                        OtpPinFieldDecoration.defaultPinBoxDecoration,
                  ),

                  MySizeBox(MediaQuery.of(context).size.height * 0.03, null),

                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "OTP will expire in ",
                          style: GoogleFonts.openSans(
                            fontSize: MediaQuery.of(context).size.height * 0.02,
                            color: const Color(0xFF6B7280),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: "00:30",
                          style: GoogleFonts.openSans(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.025,
                            color: const Color(0xff6B7280),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  MySizeBox(MediaQuery.of(context).size.height * 0.05, null),

                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Didn’t receive OTP? ",
                          style: GoogleFonts.openSans(
                            fontSize: MediaQuery.of(context).size.height * 0.02,
                            color: const Color(0xFF1F2937),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        TextSpan(
                          text: "Resend OTP",
                          style: GoogleFonts.openSans(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.022,
                            color: const Color(0xff1F2937),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),

                  MySizeBox(MediaQuery.of(context).size.height * 0.05, null),

                  // Submit button
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff1F493D),
                        padding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).size.height * 0.015),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.height * 0.03),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                            context, AppRoutes.instance.otpExpired);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 2,
                        ),
                        child: Text(
                          'Submit',
                          style: GoogleFonts.openSans(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.025,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xffFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  ),

                  MySizeBox(MediaQuery.of(context).size.height * 0.3, null),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget MySizeBox(double? height, double? width) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
