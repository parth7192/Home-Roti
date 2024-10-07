import 'package:home_roti_login_new/header.dart';

class OtpIncorrect extends StatefulWidget {
  const OtpIncorrect({super.key});

  @override
  State<OtpIncorrect> createState() => _OtpIncorrectState();
}

List<TextEditingController> _controllers =
List.generate(4, (index) => TextEditingController());
List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
final _otpPinFieldController = GlobalKey<OtpPinFieldState>();

class _OtpIncorrectState extends State<OtpIncorrect> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

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
          // Overlay with content
          Padding(
            padding: EdgeInsets.all(w * 0.04),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MySizeBox(h * 0.05, null),

                  // Back Button
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Image.asset(
                      "lib/assets/images/backbutton.png",
                      height: h * 0.025,
                      color: const Color(0xff030712),
                    ),
                  ),

                  MySizeBox(h * 0.03, null),

                  // Login heading
                  Text(
                    'Mobile Number Verification',
                    style: GoogleFonts.roboto(
                      fontSize: w * 0.07,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff1F493D),
                    ),
                  ),

                  MySizeBox(h * 0.03, null),

                  // Send OTP text
                  Text(
                    'Enter the OTP sent to Mobile Number',
                    style: GoogleFonts.openSans(
                      fontSize: w * 0.05,
                      fontWeight: FontWeight.normal,
                      color: const Color(0xff1F2937),
                    ),
                  ),

                  MySizeBox(h * 0.05, null),

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
                      print('onCodeChanged is $code');
                    },
                    fieldHeight: h * 0.08,
                    fieldWidth: w * 0.15,
                    otpPinFieldStyle: OtpPinFieldStyle(
                      textStyle: GoogleFonts.openSans(
                        color: const Color(0xff374151),
                        fontSize: w * 0.06,
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

                  MySizeBox(h * 0.03, null),

                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "OTP will expire in ",
                          style: GoogleFonts.openSans(
                            fontSize: w * 0.045,
                            color: const Color(0xFF6B7280),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: "00:30",
                          style: GoogleFonts.openSans(
                            fontSize: w * 0.045,
                            color: const Color(0xff6B7280),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  MySizeBox(h * 0.02, null),

                  Text(
                    'Wrong OTP entered. Enter it correctly.',
                    style: GoogleFonts.openSans(
                      fontSize: w * 0.045,
                      fontWeight: FontWeight.w200,
                      color: Colors.red,
                    ),
                  ),

                  MySizeBox(h * 0.05, null),

                  // Resend OTP
                  Text(
                    'Resend OTP',
                    style: GoogleFonts.openSans(
                      fontSize: w * 0.06,
                      color: const Color(0xff1F2937),
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),

                  MySizeBox(h * 0.08, null),

                  // Submit button
                  Container(
                    width: w * 0.9,
                    height: h * 0.07,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff1F493D),
                        padding: EdgeInsets.symmetric(
                          vertical: h * 0.02,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(w * 0.06),
                        ),
                      ),
                      onPressed: () {
                        // Navigator.pushNamed(context, AppRoutes.instance.login);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 2),
                        child: Text(
                          'Submit',
                          style: GoogleFonts.openSans(
                            fontSize: w * 0.045,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xffFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  ),

                  MySizeBox(h * 0.3, null),
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
