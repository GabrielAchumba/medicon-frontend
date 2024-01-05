import 'package:flutter/material.dart';
import 'package:medicon/ui/components/text_widgets.dart';
import 'package:medicon/ui/utils/FadeAnimation.dart';
import 'package:medicon/ui/utils/colors.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  var isChecked = false;
  //isAlwaysShown: true,
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xffD7FBFD), Colors.white],
              stops: [0.1, 0.5])),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Scrollbar(
              trackVisibility: true,
              interactive: true,
              thickness: 5,
              thumbVisibility: true,
              child: SingleChildScrollView(
                  child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 10.0.h, vertical: 40.h),
                child: FadeAnimation(
                  1.2,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Image(
                            image: const AssetImage('assets/images/logo.png'),
                            height: 70.0.h,
                            width: 70.0.w,
                          ),
                          SizedBox(
                            width: 20.0.w,
                          ),
                          Text(
                            'Terms & Conditions',
                            style: Theme.of(context).textTheme.headlineSmall,
                          )
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 5, right: 5, top: 10),
                        child: Column(
                          children: [
                            const SpanTexts(
                              index: '1. ',
                              header: 'Introduction',
                              details:
                                  '      Welcome to Cafia Inc ("Company", "we", "our", "us")!These Terms of Service (“Terms, “Terms of Service”) govern your use of our website located at www.cafia.app (together or individually “Service”) operated by CAFIA INC.Our Privacy Policy also governs your use of our Service and explains how we collect, safeguard and disclose information that results from your use of our web pages.Your agreement with us includes these Terms and our Privacy Policy ("Agreements"). You acknowledge that you have read and understood Agreements, and agree to be bound of them.If you do not agree with (or cannot comply with) these agreements, then you may not use the Service, but please let us know by emailing at support@cafia.app so we can try to find a solution. These Terms apply to all visitors, users and others who wish to access or use Service.',
                            ),
                            const SpanTexts(
                              index: '2. ',
                              header: 'Communications',
                              details:
                                  'By using our Service, you agree to subscribe to newsletters, marketing or promotional materials and other information we may send. However, you may opt out of receiving any, or all, of these communications from us by following the unsubscribe link or by emailing at support@cafia.app.',
                            ),
                            const SpanTexts(
                              index: '3. ',
                              header: 'Contests, Sweepstakes and Promotions',
                              details:
                                  'Any contests, sweepstakes or other promotions (collectively, “Promotions”) made available through Service may be governed by rules that are separate from these Terms of Service. If you participate in any Promotions, please review the applicable rules as well as our Privacy Policy. If the rules for a Promotion conflict with these Terms of Service, Promotion rules will apply.',
                            ),
                            const SpanTexts(
                              index: '4. ',
                              header: 'Content',
                              details:
                                  'Our Service allows you to post, link, store, share and otherwise make available certain information, text, graphics, videos, or other material (“Content”). You are responsible for Content that you post on or through Service, including its legality, reliability, and appropriateness.By posting Content on or through Service, You represent and warrant that:\n(i) Content is yours (you own it) and/or you have the right to use it and the right to grant us the rights and license as provided in these Terms.\n(ii) that the posting of your Content on or through Service does not violate the privacy rights, publicity rights, copyrights, contract rights or any other rights of any person or entity. We reserve the right to terminate the account of anyone found to be infringing on a copyright.You retain any and all of your rights to any Content you submit, post or display on or through Service and you are responsible for protecting those rights. We take no responsibility and assume no liability for Content you or any third party posts on or through Service. However, by posting Content using Service you grant us the right and license to use, modify, publicly perform, publicly display, reproduce, and distribute such Content on and through Service. You agree that this license includes the right for us to make your Content available to other users of Service, who may also use your Content subject to these Terms.CAFIA INC has the right but not the obligation to monitor and edit all Content provided by users.In addition, Content found on or through this Service are the property of CAFIA INC or used with permission. You may not distribute, modify, transmit, reuse, download, repost, copy, or use said Content, whether in whole or in part, for commercial purposes or for personal gain, without express advance written permission from us.',
                            ),
                            const SpanTexts(
                              index: '5. ',
                              header: 'Prohibited Uses',
                              details:
                                  'You may use Service only for lawful purposes and in accordance with Terms. You agree not to use Service:\n0.1. In any way that violates any applicable national or international law or regulation.\n0.2. For the purpose of exploiting, harming, or attempting to exploit or harm minors in any way by exposing them to inappropriate content or otherwise.\n0.3. To transmit, or procure the sending of, any advertising or promotional material, including any “junk mail”, “chain letter,” “spam,” or any other similar solicitation.\n0.4. To impersonate or attempt to impersonate Company, a Company employee, another user, or any other person or entity.\n0.5. In any way that infringes upon the rights of others, or in any way is illegal, threatening, fraudulent, or harmful, or in connection with any unlawful, illegal, fraudulent, or harmful purpose or activity.\n0.6. To engage in any other conduct that restricts or inhibits anyone’s use or enjoyment of Service, or which, as determined by us, may harm or offend Company or users of Service or expose them to liability.\nAdditionally, you agree not to:\n0.1. Use Service in any manner that could disable, overburden, damage, or impair Service or interfere with any other party’s use of Service, including their ability to engage in real time activities through Service.\n0.2. Use any robot, spider, or other automatic device, process, or means to access Service for any purpose, including monitoring or copying any of the material on Service.\n0.3. Use any manual process to monitor or copy any of the material on Service or for any other unauthorized purpose without our prior written consent.\n0.4. Use any device, software, or routine that interferes with the proper working of Service.\n0.5. Introduce any viruses, Trojan horses, worms, logic bombs, or other material which is malicious or technologically harmful.\n0.6. Attempt to gain unauthorized access to, interfere with, damage, or disrupt any parts of Service, the server on which Service is stored, or any server, computer, or database connected to Service.\n0.7. Attack Service via a denial-of-service attack or a distributed denial-of-service attack.\n0.8. Take any action that may damage or falsify Company rating.\n0.9. Otherwise attempt to interfere with the proper working of Service.',
                            ),
                            const SpanTexts(
                              index: '6. ',
                              header: 'Analytics',
                              details:
                                  'We may use third-party Service Providers to monitor and analyze the use of our Service.',
                            ),
                            const SpanTexts(
                              index: '7. ',
                              header: 'No Use by Minors',
                              details:
                                  'Service is intended only for access and use by individuals at least eighteen (18) years old. By accessing or using Service, you warrant and represent that you are at least eighteen (18) years of age and with the full authority, right, and capacity to enter into this agreement and abide by all of the terms and conditions of Terms. If you are not at least eighteen (18) years old, you are prohibited from both the access and usage of Service.',
                            ),
                            const SpanTexts(
                              index: '8. ',
                              header: 'Accounts',
                              details:
                                  'When you create an account with us, you guarantee that you are above the age of 18, and that the information you provide us is accurate, complete, and current at all times. Inaccurate, incomplete, or obsolete information may result in the immediate termination of your account or Service.You are responsible for maintaining the confidentiality of your account and password, including but not limited to the restriction of access to your computer and/or account. You agree to accept responsibility for any and all activities or actions that occur under your account and/or password, whether your password is with our Service or a third-party service. You must notify us immediately upon becoming aware of any breach of security or unauthorized use of your account.You may not use as a username the name of another person or entity or that is not lawfully available for use, a name or trademark that is subject to any rights of another person or entity other than you, without appropriate authorization. You may not use as a username any name that is offensive, vulgar or obscene.We reserve the right to refuse service, terminate accounts, remove or edit content, or cancel orders in our sole discretion.',
                            ),
                            const SpanTexts(
                              index: '9. ',
                              header: 'Intellectual Property',
                              details:
                                  'Service and its original content (excluding Content provided by users), features and functionality are and will remain the exclusive property of CAFIA INC and its licensors. Service is protected by copyright, trademark, and other laws of and foreign countries. Our trademarks may not be used in connection with any product or service without the prior written consent of CAFIA INC.',
                            ),
                            const SpanTexts(
                              index: '10. ',
                              header: 'Copyright Policy',
                              details:
                                  'We respect the intellectual property rights of others. It is our policy to respond to any claim that Content posted on Service infringes on the copyright or other intellectual property rights (“Infringement”) of any person or entity.If you are a copyright owner, or authorized on behalf of one, and you believe that the copyrighted work has been copied in a way that constitutes copyright infringement, please submit your claim via email to support@cafia.app, with the subject line: “Copyright Infringement” and include in your claim a detailed description of the alleged Infringement as detailed below, under “DMCA Notice and Procedure for Copyright Infringement Claims”.\nYou may be held accountable for damages (including costs and attorneys’ fees) for misrepresentation or bad-faith claims on the infringement of any Content found on and/or through Service on your copyright.',
                            ),
                            const SpanTexts(
                              index: '11. ',
                              header:
                                  'DMCA Notice and Procedure for Copyright Infringement Claims',
                              details:
                                  'You may submit a notification pursuant to the Digital Millennium Copyright Act (DMCA) by providing our Copyright Agent with the following information in writing (see 17 U.S.C 512(c)(3) for further detail):\n0.1. An electronic or physical signature of the person authorized to act on behalf of the owner of the copyright’s interest;\n0.2. A description of the copyrighted work that you claim has been infringed, including the URL (i.e., web page address) of the location where the copyrighted work exists or a copy of the copyrighted work;\n0.3. Identification of the URL or other specific location on Service where the material that you claim is infringing is located;\n0.4. Your address, telephone number, and email address;\n0.5. A statement by you that you have a good faith belief that the disputed use is not authorized by the copyright owner, its agent, or the law;\n0.6. A statement by you, made under penalty of perjury, that the above information in your notice is accurate and that you are the copyright owner or authorized to act on the copyright owner’s behalf. You can contact our Copyright Agent via email at support@cafia.app.',
                            ),
                            const SpanTexts(
                              index: '12. ',
                              header: 'Error Reporting and Feedback',
                              details:
                                  'You may provide us either directly at support@cafia.app or via third party sites and tools with information and feedback concerning errors, suggestions for improvements, ideas, problems, complaints, and other matters related to our Service (“Feedback”). You acknowledge and agree that:\n(i) You shall not retain, acquire or assert any intellectual property right or other right, title or interest in or to the Feedback;\n(ii) Company may have development ideas similar to the Feedback;\n(iii) Feedback does not contain confidential information or proprietary information from you or any third party; and\n(iv) Company is not under any obligation of confidentiality with respect to the Feedback. In the event the transfer of the ownership to the Feedback is not possible due to applicable mandatory laws, you grant Company and its affiliates an exclusive, transferable, irrevocable, free-of-charge, sub-licensable, unlimited and perpetual right to use (including copy, modify, create derivative works, publish, distribute and commercialize) Feedback in any manner and for any purpose.',
                            ),
                            const SpanTexts(
                              index: '13. ',
                              header: 'Links To Other Web Sites',
                              details:
                                  'Our Service may contain links to third party web sites or services that are not owned or controlled by CAFIA INC.\nCAFIA INC has no control over, and assumes no responsibility for the content, privacy policies, or practices of any third party web sites or services. We do not warrant the offerings of any of these entities/individuals or their websites.\nYOU ACKNOWLEDGE AND AGREE THAT COMPANY SHALL NOT BE RESPONSIBLE OR LIABLE, DIRECTLY OR INDIRECTLY, FOR ANY DAMAGE OR LOSS CAUSED OR ALLEGED TO BE CAUSED BY OR IN CONNECTION WITH USE OF OR RELIANCE ON ANY SUCH CONTENT, GOODS OR SERVICES AVAILABLE ON OR THROUGH ANY SUCH THIRD PARTY WEB SITES OR SERVICES.\nWE STRONGLY ADVISE YOU TO READ THE TERMS OF SERVICE AND PRIVACY POLICIES OF ANY THIRD PARTY WEB SITES OR SERVICES THAT YOU VISIT.',
                            ),
                            const SpanTexts(
                              index: '14. ',
                              header: 'Disclaimer of Warranty',
                              details:
                                  'THESE SERVICES ARE PROVIDED BY COMPANY ON AN “AS IS” AND “AS AVAILABLE” BASIS. COMPANY MAKES NO REPRESENTATIONS OR WARRANTIES OF ANY KIND, EXPRESS OR IMPLIED, AS TO THE OPERATION OF THEIR SERVICES, OR THE INFORMATION, CONTENT OR MATERIALS INCLUDED THEREIN. YOU EXPRESSLY AGREE THAT YOUR USE OF THESE SERVICES, THEIR CONTENT, AND ANY SERVICES OR ITEMS OBTAINED FROM US IS AT YOUR SOLE RISK.\nNEITHER COMPANY NOR ANY PERSON ASSOCIATED WITH COMPANY MAKES ANY WARRANTY OR REPRESENTATION WITH RESPECT TO THE COMPLETENESS, SECURITY, RELIABILITY, QUALITY, ACCURACY, OR AVAILABILITY OF THE SERVICES. WITHOUT LIMITING THE FOREGOING, NEITHER COMPANY NOR ANYONE ASSOCIATED WITH COMPANY REPRESENTS OR WARRANTS THAT THE SERVICES, THEIR CONTENT, OR ANY SERVICES OR ITEMS OBTAINED THROUGH THE SERVICES WILL BE ACCURATE, RELIABLE, ERROR-FREE, OR UNINTERRUPTED, THAT DEFECTS WILL BE CORRECTED, THAT THE SERVICES OR THE SERVER THAT MAKES IT AVAILABLE ARE FREE OF VIRUSES OR OTHER HARMFUL COMPONENTS OR THAT THE SERVICES OR ANY SERVICES OR ITEMS OBTAINED THROUGH THE SERVICES WILL OTHERWISE MEET YOUR NEEDS OR EXPECTATIONS.\nCOMPANY HEREBY DISCLAIMS ALL WARRANTIES OF ANY KIND, WHETHER EXPRESS OR IMPLIED, STATUTORY, OR OTHERWISE, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT, AND FITNESS FOR PARTICULAR PURPOSE.\nTHE FOREGOING DOES NOT AFFECT ANY WARRANTIES WHICH CANNOT BE EXCLUDED OR LIMITED UNDER APPLICABLE LAW.',
                            ),
                            const SpanTexts(
                              index: '15. ',
                              header: 'Limitation Of Liability',
                              details:
                                  'EXCEPT AS PROHIBITED BY LAW, YOU WILL HOLD US AND OUR OFFICERS, DIRECTORS, EMPLOYEES, AND AGENTS HARMLESS FOR ANY INDIRECT, PUNITIVE, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGE, HOWEVER IT ARISES (INCLUDING ATTORNEYS’ FEES AND ALL RELATED COSTS AND EXPENSES OF LITIGATION AND ARBITRATION, OR AT TRIAL OR ON APPEAL, IF ANY, WHETHER OR NOT LITIGATION OR ARBITRATION IS INSTITUTED), WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE, OR OTHER TORTIOUS ACTION, OR ARISING OUT OF OR IN CONNECTION WITH THIS AGREEMENT, INCLUDING WITHOUT LIMITATION ANY CLAIM FOR PERSONAL INJURY OR PROPERTY DAMAGE, ARISING FROM THIS AGREEMENT AND ANY VIOLATION BY YOU OF ANY FEDERAL, STATE, OR LOCAL LAWS, STATUTES, RULES, OR REGULATIONS, EVEN IF COMPANY HAS BEEN PREVIOUSLY ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. EXCEPT AS PROHIBITED BY LAW, IF THERE IS LIABILITY FOUND ON THE PART OF COMPANY, IT WILL BE LIMITED TO THE AMOUNT PAID FOR THE PRODUCTS AND/OR SERVICES, AND UNDER NO CIRCUMSTANCES WILL THERE BE CONSEQUENTIAL OR PUNITIVE DAMAGES. SOME STATES DO NOT ALLOW THE EXCLUSION OR LIMITATION OF PUNITIVE, INCIDENTAL OR CONSEQUENTIAL DAMAGES, SO THE PRIOR LIMITATION OR EXCLUSION MAY NOT APPLY TO YOU.',
                            ),
                            const SpanTexts(
                              index: '16. ',
                              header: 'Termination',
                              details:
                                  'We may terminate or suspend your account and bar access to Service immediately, without prior notice or liability, under our sole discretion, for any reason whatsoever and without limitation, including but not limited to a breach of Terms.\nIf you wish to terminate your account, you may simply discontinue using Service.\nAll provisions of Terms which by their nature should survive termination shall survive termination, including, without limitation, ownership provisions, warranty disclaimers, indemnity and limitations of liability.',
                            ),
                            const SpanTexts(
                              index: '17. ',
                              header: 'Governing Law',
                              details:
                                  'These Terms shall be governed and construed in accordance with the laws of Port Harcourt, Nigeria, which governing law applies to agreement without regard to its conflict of law provisions.\n   Our failure to enforce any right or provision of these Terms will not be considered a waiver of those rights. If any provision of these Terms is held to be invalid or unenforceable by a court, the remaining provisions of these Terms will remain in effect. These Terms constitute the entire agreement between us regarding our Service and supersede and replace any prior agreements we might have had between us regarding Service., ownership provisions, warranty disclaimers, indemnity and limitations of liability.',
                            ),
                            const SpanTexts(
                              index: '18. ',
                              header: 'Changes To Service',
                              details:
                                  'We reserve the right to withdraw or amend our Service, and any service or material we provide via Service, in our sole discretion without notice. We will not be liable if for any reason all or any part of Service is unavailable at any time or for any period. From time to time, we may restrict access to some parts of Service, or the entire Service, to users, including registered users.',
                            ),
                            const SpanTexts(
                              index: '19. ',
                              header: 'Amendments to Terms',
                              details:
                                  'We may amend Terms at any time by posting the amended terms on this site. It is your responsibility to review these Terms periodically.\n   Your continued use of the Platform following the posting of revised Terms means that you accept and agree to the changes. You are expected to check this page frequently so you are aware of any changes, as they are binding on you.\n   By continuing to access or use our Service after any revisions become effective, you agree to be bound by the revised terms. If you do not agree to the new terms, you are no longer authorized to use Service.',
                            ),
                            const SpanTexts(
                              index: '20. ',
                              header: 'Waiver and Severability',
                              details:
                                  'No waiver by Company of any term or condition set forth in Terms shall be deemed a further or continuing waiver of such term or condition or a waiver of any other term or condition, and any failure of Company to assert a right or provision under Terms shall not constitute a waiver of such right or provision.\n   If any provision of Terms is held by a court or other tribunal of competent jurisdiction to be invalid, illegal or unenforceable for any reason, such provision shall be eliminated or limited to the minimum extent such that the remaining provisions of Terms will continue in full force and effect.',
                            ),
                            const SpanTexts(
                              index: '21. ',
                              header: 'Acknowledgement',
                              details:
                                  'BY USING SERVICE OR OTHER SERVICES PROVIDED BY US, YOU ACKNOWLEDGE THAT YOU HAVE READ THESE TERMS OF SERVICE AND AGREE TO BE BOUND BY THEM.',
                            ),
                            const SpanTexts(
                              index: '22. ',
                              header: 'Contact Us',
                              details:
                                  'Please send your feedback, comments and requests for technical support by email: support@cafia.app',
                            ),
                            SizedBox(
                              height: 70.h,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
            ),
            Positioned(
              bottom: 0,
              child: FadeAnimation(
                1.4,
                Container(
                  height: 160.h,
                  width: 500.w,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      const Color(0xffD7FBFD).withOpacity(1.0),
                      Colors.grey.withOpacity(0.05)
                    ],
                  )),
                ),
              ),
            ),
            Positioned(
              left: 20,
              bottom: 10,
              child: FadeAnimation(
                1.4,
                Column(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          activeColor: const Color(0xff66C990),
                          onChanged: (value) {
                            setState(
                              () {
                                isChecked = value as bool;
                              },
                            );
                          },
                        ),
                        Text(
                          !isChecked
                              ? 'Accept the terms and condition to continue'
                              : 'please continue to complete registration',
                          style: TextStyle(
                              color: !isChecked
                                  ? AppColors.red
                                  : const Color(0xff66C990),
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (!isChecked) return;

                        Navigator.of(context).pop();
                      },
                      child: const Text('Agree & Continue'),
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xff66C990),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          fixedSize: Size(200.w, 50.h)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SpanTexts extends StatelessWidget {
  final String index;
  final String header;
  final String details;
  const SpanTexts({
    Key? key,
    required this.header,
    required this.details,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text.rich(TextSpan(children: [
          TextSpan(text: index),
          TextSpan(
              text: header,
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold)),
        ])),
        SizedBox(
          height: 5.h,
        ),
        Text(
          details,
          style: const TextStyle(height: 1.5),
          softWrap: true,
          textAlign: TextAlign.justify,
        ),
        SizedBox(
          height: 10.h,
        )
      ],
    );
  }
}
