import 'package:flutter/material.dart';
import 'package:medicon/ui/components/custom_scaffold.dart';
import 'package:medicon/ui/components/text_widgets.dart';
import 'package:medicon/ui/utils/FadeAnimation.dart';
import 'package:medicon/ui/utils/colors.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: 'Privacy Policy',
        child: FadeAnimation(
          1.2,
          ListView(
            physics: const BouncingScrollPhysics(),
            padding:
                EdgeInsets.symmetric(vertical: 10.0.sp, horizontal: 10.0.sp),
            children: <Widget>[
              regularText('Effective date: 2021-05-31',
                  fontSize: 15, fontWeight: FontWeight.bold),
              SizedBox(
                height: 10.h,
              ),
              const SpanTexts(
                  header: 'Introduction',
                  details:
                      'Welcome to CAFIA INC.CAFIA INC LTD (“us”, “we”, or “our”) operates cafia.app (hereinafter referred to as “Service”).Our Privacy Policy governs your visit to cafia.app, and explains how we collect, safeguard and disclose information that results from your use of our Service.We use your data to provide and improve Service. By using Service, you agree to the collection and use of information in accordance with this policy. Unless otherwise defined in this Privacy Policy, the terms used in this Privacy Policy have the same meanings as in our Terms and Conditions.Our Terms and Conditions (“Terms”) govern all use of our Service and together with the Privacy Policy constitutes your agreement with us (“agreement”).',
                  index: '1. '),
              const SpanTexts(
                  header: 'Information Collection and Use',
                  details:
                      'We collect several different types of information for various purposes to provide and improve our Service to you.',
                  index: '3. '),
              Text.rich(TextSpan(children: [
                const TextSpan(text: '4. '),
                TextSpan(
                    text: 'Types of Data Collected',
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    )),
              ])),
              SizedBox(
                height: 10.h,
              ),
              const SpanTexts(
                  header: 'Personal Data',
                  details:
                      'While using our Service, we may ask you to provide us with certain personally identifiable information that can be used to contact or identify you (“Personal Data”). Personally identifiable information may include, but is not limited to:\n0.1. Email address\n0.2. First name and last name\n0.3. Phone number\n0.4. Address, Country, State, Province, ZIP/Postal code, City\n0.5. Cookies and Usage DataWe may use your Personal Data to contact you with newsletters, marketing or promotional materials and other information that may be of interest to you. You may opt out of receiving any, or all, of these communications from us by following the unsubscribe link.',
                  index: 'a.'),
              const SpanTexts(
                  header: 'Usage Data',
                  details:
                      'We may also collect information that your browser sends whenever you visit our Service or when you access Service by or through any device (“Usage Data”).This Usage Data may include information such as your computer’s Internet Protocol address (e.g. IP address), browser type, browser version, the pages of our Service that you visit, the time and date of your visit, the time spent on those pages, unique device identifiers and other diagnostic data.When you access Service with a device, this Usage Data may include information such as the type of device you use, your device unique ID, the IP address of your device, your device operating system, the type of Internet browser you use, unique device identifiers and other diagnostic data.',
                  index: 'b. '),
              const SpanTexts(
                  header: 'Location Data',
                  details:
                      'We may use and store information about your location if you give us permission to do so (“Location Data”). We use this data to provide features of our Service, to improve and customize our Service.You can enable or disable location services when you use our Service at any time by way of your device settings.',
                  index: 'c. '),
              const SpanTexts(
                  header: 'Tracking Cookies Data',
                  details:
                      'We use cookies and similar tracking technologies to track the activity on our Service and we hold certain information.Cookies are files with a small amount of data which may include an anonymous unique identifier. Cookies are sent to your browser from a website and stored on your device. Other tracking technologies are also used such as beacons, tags and scripts to collect and track information and to improve and analyze our Service.You can instruct your browser to refuse all cookies or to indicate when a cookie is being sent. However, if you do not accept cookies, you may not be able to use some portions of our Service.\nExamples of Cookies we use:\n0.1. Session Cookies: We use Session Cookies to operate our Service.\n0.2. Preference Cookies: We use Preference Cookies to remember your preferences and various settings.\n0.3. Security Cookies: We use Security Cookies for security purposes.\n0.4. Advertising Cookies: Advertising Cookies are used to serve you with advertisements that may be relevant to you and your interests.\nOther Data\nWhile using our Service, we may also collect the following information: sex, age, date of birth, place of birth, passport details, citizenship, registration at place of residence and actual address, telephone number (work, mobile), details of documents on education, qualification, professional training, employment agreements, NDA agreement information on bonuses and compensation, information on marital status, family members, social security (or other taxpayer identification) number, office location and other data.',
                  index: 'd. '),
              const SpanTexts(
                  header: 'Use of Data',
                  details:
                      'CAFIA INC LTD uses the collected data for various purposes:\n0.1. To provide and maintain our Service;\n0.2. To notify you about changes to our Service;\n0.3. To allow you to participate in interactive features of our Service when you choose to do so;\n0.4. To provide customer support;\n0.5. To gather analysis or valuable information so that we can improve our Service;\n0.6. To monitor the usage of our Service;\n0.7. To detect, prevent and address technical issues;\n0.8. To fulfil any other purpose for which you provide it;\n0.9. To carry out our obligations and enforce our rights arising from any contracts entered into between you and us, including for billing and collection;\n0.10. To provide you with notices about your account and/or subscription, including expiration and renewal notices, email-instructions, etc.\n0.11. to provide you with news, special offers and general information about other goods, services and events which we offer that are similar to those that you have already purchased or enquired about unless you have opted not to receive such information;\n0.12. In any other way we may describe when you provide the information;\n0.13. For any other purpose with your consent.',
                  index: '5. '),
              const SpanTexts(
                  header: 'Retention of Data',
                  details:
                      'We will retain your Personal Data only for as long as is necessary for the purposes set out in this Privacy Policy. We will retain and use your Personal Data to the extent necessary to comply with our legal obligations (for example, if we are required to retain your data to comply with applicable laws), resolve disputes, and enforce our legal agreements and policies.We will also retain Usage Data for internal analysis purposes. Usage Data is generally retained for a shorter period, except when this data is used to strengthen the security or to improve the functionality of our Service, or we are legally obligated to retain this data for longer time periods.',
                  index: '6. '),
              const SpanTexts(
                  header: 'Transfer of Data',
                  details:
                      'Your information, including Personal Data, may be transferred to – and maintained on – computers located outside of your state, province, country or other governmental jurisdiction where the data protection laws may differ from those of your jurisdiction.\nIf you are located outside Nigeria and choose to provide information to us, please note that we transfer the data, including Personal Data, to Nigeria and process it there.\nYour consent to this Privacy Policy followed by your submission of such information represents your agreement to that transfer.\nCAFIA INC LTD will take all the steps reasonably necessary to ensure that your data is treated securely and in accordance with this Privacy Policy and no transfer of your Personal Data will take place to an organization or a country unless there are adequate controls in place including the security of your data and other personal information.',
                  index: '7. '),
              const SpanTexts(
                  header: 'Disclosure of Data',
                  details:
                      'We may disclose personal information that we collect, or you provide:\n0.1. Business Transaction.\nIf we or our subsidiaries are involved in a merger, acquisition or asset sale, your Personal Data may be transferred.\n0.2. Other cases. We may disclose your information also:\n0.2.1. To our subsidiaries and affiliates;\n0.2.2. To contractors, service providers, and other third parties we use to support our business;\n0.2.3. To fulfill the purpose for which you provide it;\n0.2.4. For the purpose of including your company’s logo on our website;\n0.2.5. For any other purpose disclosed by us when you provide the information;\n0.2.6. With your consent in any other cases;\n0.2.7. If we believe disclosure is necessary or appropriate to protect the rights, property, or safety of the Company, our customers, or others.',
                  index: '8. '),
              const SpanTexts(
                  header: 'Security of Data',
                  details:
                      'The security of your data is important to us but remember that no method of transmission over the Internet or method of electronic storage is 100% secure. While we strive to use commercially acceptable means to protect your Personal Data, we cannot guarantee its absolute security.',
                  index: '9. '),
              const SpanTexts(
                  header:
                      'Your Data Protection Rights under General Data Protection Regulation (GDPR)',
                  details:
                      'If you are a resident of the European Union (EU) and European Economic Area (EEA), you have certain data protection rights, covered by GDPR.We aim to take reasonable steps to allow you to correct, amend, delete, or limit the use of your Personal Data.If you wish to be informed what Personal Data we hold about you and if you want it to be removed from our systems, please email us at support@cafia.app.\nIn certain circumstances, you have the following data protection rights:\n0.1. The right to access, update or to delete the information we have on you;\n0.2. The right of rectification. You have the right to have your information rectified if that information is inaccurate or incomplete;\n0.3. The right to object. You have the right to object to our processing of your Personal Data;\n0.4. The right of restriction. You have the right to request that we restrict the processing of your personal information;\n0.5. The right to data portability. You have the right to be provided with a copy of your Personal Data in a structured, machine-readable and commonly used format;\n0.6. The right to withdraw consent. You also have the right to withdraw your consent at any time where we rely on your consent to process your personal information;\nPlease note that we may ask you to verify your identity before responding to such requests. Please note, we may not able to provide Service without some necessary data.\n    You have the right to complain to a Data Protection Authority about our collection and use of your Personal Data. For more information, please contact your local data protection authority in the European Economic Area (EEA).',
                  index: '10. '),
              const SpanTexts(
                  header:
                      'Your Data Protection Rights under the California Privacy Protection Act (CalOPPA)',
                  details:
                      'CalOPPA is the first state law in the nation to require commercial websites and online services to post a privacy policy. The law’s reach stretches well beyond California to require a person or company in the United States (and conceivable the world) that operates websites collecting personally identifiable information from California consumers to post a conspicuous privacy policy on its website stating exactly the information being collected and those individuals with whom it is being shared, and to comply with this policy.\n   According to CalOPPA we agree to the following:\n0.1. Users can visit our site anonymously;\n0.2. Our Privacy Policy link includes the word “Privacy”, and can easily be found on the home page of our website;\n0.3. Users will be notified of any privacy policy changes on our Privacy Policy Page;\n0.4. Users are able to change their personal information by emailing us at support@cafia.app.\n    Our Policy on “Do Not Track” Signals:\n    We honour Do Not Track signals and do not track, plant cookies, or use advertising when a Do Not Track browser mechanism is in place. Do Not Track is a preference you can set in your web browser to inform websites that you do not want to be tracked.\n   You can enable or disable Do Not Track by visiting the Preferences or Settings page of your web browser.',
                  index: '11. '),
              const SpanTexts(
                  header:
                      'Your Data Protection Rights under the California Consumer Privacy Act (CCPA)',
                  details:
                      'If you are a California resident, you are entitled to learn what data we collect about you, ask to delete your data and not to sell (share) it. To exercise your data protection rights, you can make certain requests and ask us:\n0.1. What personal information we have about you. If you make this request, we will return to you:\n0.0.1. The categories of personal information we have collected about you.\n0.0.2. The categories of sources from which we collect your personal information.\n0.0.3. The business or commercial purpose for collecting or selling your personal information.\n0.0.4. The categories of third parties with whom we share personal information.\n0.0.5. The specific pieces of personal information we have collected about you.\n0.0.6. A list of categories of personal information that we have sold, along with the category of any other company we sold it to. If we have not sold your personal information, we will inform you of that fact.\n0.0.7. A list of categories of personal information that we have disclosed for a business purpose, along with the category of any other company we shared it with.\n   Please note, you are entitled to ask us to provide you with this information up to two times in a rolling twelve-month period. When you make this request, the information provided may be limited to the personal information we collected about you in the previous 12 months.\n0.2. To delete your personal information. If you make this request, we will delete the personal information we hold about you as of the date of your request from our records and direct any service providers to do the same. In some cases, deletion may be accomplished through de-identification of the information. If you choose to delete your personal information, you may not be able to use certain functions that require your personal information to operate.\n 0.3. To stop selling your personal information. We don’t sell or rent your personal information to any third parties for any purpose. We do not sell your personal information for monetary consideration. However, under some circumstances, a transfer of personal information to a third party, or within our family of companies, without monetary consideration may be considered a “sale” under California law. You are the only owner of your Personal Data and can request disclosure or deletion at any time.   If you submit a request to stop selling your personal information, we will stop making such transfers.\n    Please note, if you ask us to delete or stop selling your data, it may impact your experience with us, and you may not be able to participate in certain programs or membership services which require the usage of your personal information to function. But in no circumstances, we will discriminate against you for exercising your rights.\n    To exercise your California data protection rights described above, please send your request(s) by email: support@cafia.app.\n  Your data protection rights, described above, are covered by the CCPA, short for the California Consumer Privacy Act. To find out more, visit the official California Legislative Information website. The CCPA took effect on 01/01/2020.If you are a California resident, you are entitled to learn what data we collect about you, ask to delete your data and not to sell (share) it. To exercise your data protection rights, you can make certain requests and ask us:\n 0.1. What personal information we have about you. If you make this request, we will return to you:\n0.0.1. The categories of personal information we have collected about you.\n 0.0.2. The categories of sources from which we collect your personal information.\n 0.0.3. The business or commercial purpose for collecting or selling your personal information.\n0.0.4. The categories of third parties with whom we share personal information.\n0.0.5. The specific pieces of personal information we have collected about you.\n0.0.6. A list of categories of personal information that we have sold, along with the category of any other company we sold it to. If we have not sold your personal information, we will inform you of that fact.\n0.0.7. A list of categories of personal information that we have disclosed for a business purpose, along with the category of any other company we shared it with.\n  Please note, you are entitled to ask us to provide you with this information up to two times in a rolling twelve-month period. When you make this request, the information provided may be limited to the personal information we collected about you in the previous 12 months.\n 0.2. To delete your personal information. If you make this request, we will delete the personal information we hold about you as of the date of your request from our records and direct any service providers to do the same. In some cases, deletion may be accomplished through de-identification of the information. If you choose to delete your personal information, you may not be able to use certain functions that require your personal information to operate.\n 0.3. To stop selling your personal information. We don’t sell or rent your personal information to any third parties for any purpose. We do not sell your personal information for monetary consideration. However, under some circumstances, a transfer of personal information to a third party, or within our family of companies, without monetary consideration may be considered a “sale” under California law. You are the only owner of your Personal Data and can request disclosure or deletion at any time.\n  If you submit a request to stop selling your personal information, we will stop making such transfers.\n  Please note, if you ask us to delete or stop selling your data, it may impact your experience with us, and you may not be able to participate in certain programs or membership services which require the usage of your personal information to function. But in no circumstances, we will discriminate against you for exercising your rights.\n  To exercise your California data protection rights described above, please send your request(s) by email: support@cafia.app.\n  Your data protection rights, described above, are covered by the CCPA, short for the California Consumer Privacy Act. To find out more, visit the official California Legislative Information website. The CCPA took effect on 01/01/2020.',
                  index: '12. '),
              const SpanTexts(
                  header: 'Service Providers',
                  details:
                      'We may employ third party companies and individuals to facilitate our Service (“Service Providers”), provide Service on our behalf, perform Service-related services or assist us in analyzing how our Service is used.\n  These third parties have access to your Personal Data only to perform these tasks on our behalf and are obligated not to disclose or use it for any other purpose.',
                  index: '13. '),
              const SpanTexts(
                  header: 'Analytics',
                  details:
                      'We may use third-party Service Providers to monitor and analyze the use of our Service.',
                  index: '14. '),
              const SpanTexts(
                  header: 'CI/CD tools',
                  details:
                      'We may use third-party Service Providers to automate the development process of our Service.',
                  index: '15. '),
              const SpanTexts(
                  header: 'Behavioral Remarketing',
                  details:
                      'We may use remarketing services to advertise on third party websites to you after you visited our Service. We and our third-party vendors use cookies to inform, optimize and serve ads based on your past visits to our Service.',
                  index: '16. '),
              const SpanTexts(
                  header: 'Payments',
                  details:
                      'We may provide paid products and/or services within Service. In that case, we use third-party services for payment processing (e.g. payment processors).\n    We will not store or collect your payment card details. That information is provided directly to our third-party payment processors whose use of your personal information is governed by their Privacy Policy. These payment processors adhere to the standards set by PCI-DSS as managed by the PCI Security Standards Council, which is a joint effort of brands like Visa, MasterCard, American Express and Discover. PCI-DSS requirements help ensure the secure handling of payment information.',
                  index: '17. '),
              const SpanTexts(
                  header: 'Links to Other Sites',
                  details:
                      'Our Service may contain links to other sites that are not operated by us. If you click a third party link, you will be directed to that third party’s site. We strongly advise you to review the Privacy Policy of every site you visit.\n   We have no control over and assume no responsibility for the content, privacy policies or practices of any third party sites or services.',
                  index: '18. '),
              const SpanTexts(
                  header: 'Children’s Privacy',
                  details:
                      'Our Services are not intended for use by children under the age of 18 (“Child” or “Children”).\n   We do not knowingly collect personally identifiable information from Children under 18. If you become aware that a Child has provided us with Personal Data, please contact us. If we become aware that we have collected Personal Data from Children without verification of parental consent, we take steps to remove that information from our servers.',
                  index: '19. '),
              const SpanTexts(
                  header: 'Changes to This Privacy Policy',
                  details:
                      'We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page.\n    We will let you know via email and/or a prominent notice on our Service, prior to the change becoming effective and update “effective date” at the top of this Privacy Policy.\n      You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.',
                  index: '20. '),
              const SpanTexts(
                  header: 'Contact Us',
                  details:
                      'If you have any questions about this Privacy Policy, please contact us by email: support@cafia.app.',
                  index: '21. '),
              SizedBox(
                height: 20.0.h,
              )
            ],
          ),
        ));
  }
}

class SpanTexts extends StatelessWidget {
  final String? index;
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
