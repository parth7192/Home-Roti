import 'package:home_roti_login_new/header.dart';

class OtpExpired extends StatefulWidget {
  const OtpExpired({super.key});

  @override
  State<OtpExpired> createState() => _OtpExpiredState();
}

class _OtpExpiredState extends State<OtpExpired> {
  List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());
  List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
  final _otpPinFieldController = GlobalKey<OtpPinFieldState>();

  Widget _otpTextField(int index, BuildContext context) {
    return Container(
      width:
          MediaQuery.of(context).size.width * 0.13, // Relative to screen width
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
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
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MySizeBox(height: MediaQuery.of(context).size.height * 0.04),
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
                  MySizeBox(height: MediaQuery.of(context).size.height * 0.03),
                  Text(
                    'Mobile Number Verification',
                    style: GoogleFonts.roboto(
                      fontSize: MediaQuery.of(context).size.width * 0.07,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff1F493D),
                    ),
                  ),
                  MySizeBox(height: MediaQuery.of(context).size.height * 0.1),
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
                    fieldHeight: MediaQuery.of(context).size.width * 0.18,
                    fieldWidth: MediaQuery.of(context).size.width * 0.18,
                    otpPinFieldStyle: OtpPinFieldStyle(
                      textStyle: GoogleFonts.openSans(
                        color: const Color(0xff374151),
                        fontSize: MediaQuery.of(context).size.width * 0.07,
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
                  MySizeBox(height: MediaQuery.of(context).size.height * 0.05),
                  Text(
                    'OTP expired.',
                    style: GoogleFonts.openSans(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.w200,
                      color: Colors.red,
                    ),
                  ),
                  MySizeBox(height: MediaQuery.of(context).size.height * 0.07),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Didn’t receive OTP? ",
                          style: GoogleFonts.openSans(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            color: const Color(0xFF1F2937),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        TextSpan(
                          text: "Resend OTP",
                          style: GoogleFonts.openSans(
                            fontSize: MediaQuery.of(context).size.width * 0.043,
                            color: const Color(0xff1F2937),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MySizeBox(height: MediaQuery.of(context).size.height * 0.08),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff1F493D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * 0.06),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'otp_incorrect');
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Submit',
                          style: GoogleFonts.openSans(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xffFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  ),
                  MySizeBox(height: MediaQuery.of(context).size.height * 0.3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget MySizeBox({double? height, double? width}) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
