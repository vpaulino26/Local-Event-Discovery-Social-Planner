import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'a_i_assist_model.dart';
export 'a_i_assist_model.dart';

/// Create a popup component called "AIAssistant" for asking questions about
/// an event:
///
/// LAYOUT:
/// - White rounded card (16px radius) with 90% width, centered
/// - Header: "Ask AI Assistant" title + X close button
/// - Chat area: 300px tall ListView showing conversation bubbles
///   * User: right-aligned, purple bg (#7B68B7), white text
///   * AI: left-aligned, gray bg, dark text
/// - Input bar at bottom: TextField + purple send button
///
/// STYLING:
/// - Overall padding: 20px
/// - Message bubbles: rounded corners, 12px padding
/// - TextField: hint "Ask about parking, venue, pricing..."
/// - Send button: circular, only enabled when text entered
///
/// BEHAVIOR:
/// - Show loading spinner while waiting for response
/// - Clear input after sending
/// - Auto-scroll to newest message
/// - X button closes popup
///
/// PARAMETERS:
/// - eventName (String)
/// - eventData (JSON) - all event details for AI
class AIAssistWidget extends StatefulWidget {
  const AIAssistWidget({
    super.key,
    this.eventName,
    this.venueName,
    this.formattedDate,
    this.formattedTime,
    this.location,
    this.priceRange,
    this.description,
    this.parkingDetail,
    this.ticketUrl,
    this.homepageUrl,
    this.categorySegment,
    this.categoryGenre,
    this.venueAddressLine1,
    this.accessibilityInfo,
    this.seatmapUrl,
    this.minPrice,
    this.maxPrice,
    this.distance,
  });

  final String? eventName;
  final String? venueName;
  final String? formattedDate;
  final String? formattedTime;
  final String? location;
  final String? priceRange;
  final String? description;
  final String? parkingDetail;
  final String? ticketUrl;
  final String? homepageUrl;
  final String? categorySegment;
  final String? categoryGenre;
  final String? venueAddressLine1;
  final String? accessibilityInfo;
  final String? seatmapUrl;
  final String? minPrice;
  final String? maxPrice;
  final String? distance;

  @override
  State<AIAssistWidget> createState() => _AIAssistWidgetState();
}

class _AIAssistWidgetState extends State<AIAssistWidget> {
  late AIAssistModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AIAssistModel());

    _model.textController ??=
        TextEditingController(text: _model.currentQuestion);
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.996,
      constraints: BoxConstraints(
        minHeight: 485.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 12.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              4.0,
            ),
            spreadRadius: 0.0,
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Ask AI Assistant',
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        font: GoogleFonts.interTight(
                          fontWeight: FontWeight.bold,
                          fontStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontStyle,
                        ),
                        fontSize: 28.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleMedium.fontStyle,
                      ),
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 16.0,
                  buttonSize: 45.0,
                  fillColor: Colors.transparent,
                  icon: Icon(
                    Icons.close,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 27.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent('A_I_ASSIST_COMP_close_ICN_ON_TAP');
                    logFirebaseEvent('IconButton_bottom_sheet');
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 351.02,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 1.0,
                ),
              ),
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 343.21,
                      decoration: BoxDecoration(),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              child: Text(
                                _model.aiResponseComp,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.textController',
                        Duration(milliseconds: 2000),
                        () async {
                          logFirebaseEvent(
                              'A_I_ASSIST_TextField_62458mtw_ON_TEXTFIE');
                          logFirebaseEvent('TextField_update_component_state');
                          _model.currentQuestion = _model.textController.text;
                          safeSetState(() {});
                        },
                      ),
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Ask about parking, venue, pricing...',
                        hintStyle:
                            FlutterFlowTheme.of(context).bodyLarge.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontStyle,
                                  ),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .fontStyle,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        filled: true,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 20.0, 16.0, 20.0),
                        suffixIcon: _model.textController!.text.isNotEmpty
                            ? InkWell(
                                onTap: () async {
                                  _model.textController?.clear();
                                  logFirebaseEvent(
                                      'A_I_ASSIST_TextField_62458mtw_ON_TEXTFIE');
                                  logFirebaseEvent(
                                      'TextField_update_component_state');
                                  _model.currentQuestion =
                                      _model.textController.text;
                                  safeSetState(() {});
                                  safeSetState(() {});
                                },
                                child: Icon(
                                  Icons.clear,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 22.0,
                                ),
                              )
                            : null,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 24.0,
                  buttonSize: 48.0,
                  fillColor: FlutterFlowTheme.of(context).primary,
                  icon: Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 20.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent('A_I_ASSIST_COMP_send_ICN_ON_TAP');
                    logFirebaseEvent('IconButton_custom_action');
                    _model.aiOutput = await actions.callAIWithQuestion(
                      _model.currentQuestion,
                      widget.eventName!,
                    );
                    logFirebaseEvent('IconButton_update_component_state');
                    _model.aiResponseComp = _model.aiOutput!;
                    safeSetState(() {});
                    logFirebaseEvent('IconButton_update_component_state');
                    _model.currentQuestion = '\"\"';
                    safeSetState(() {});

                    safeSetState(() {});
                  },
                ),
              ].divide(SizedBox(width: 12.0)),
            ),
          ].divide(SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
