prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run this script using a SQL client connected to the database as
-- the owner (parsing schema) of the application or as a database user with the
-- APEX_ADMINISTRATOR_ROLE role.
--
-- This export file has been automatically generated. Modifying this file is not
-- supported by Oracle and can lead to unexpected application and/or instance
-- behavior now or in the future.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.5'
,p_default_workspace_id=>9125937783033791
,p_default_application_id=>102
,p_default_id_offset=>0
,p_default_owner=>'STRAVA'
);
end;
/
 
prompt APPLICATION 102 - plamen9-plugins
--
-- Application Export:
--   Application:     102
--   Name:            plamen9-plugins
--   Date and Time:   11:51 Sunday October 29, 2023
--   Exported By:     DEV
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 9746674056784623
--   Manifest End
--   Version:         23.1.5
--   Instance ID:     9025458732818453
--

begin
  -- replace components
  wwv_flow_imp.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/template_component/conference_card
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(9746674056784623)
,p_plugin_type=>'TEMPLATE COMPONENT'
,p_theme_id=>nvl(wwv_flow_application_install.get_theme_id, '')
,p_name=>'CONFERENCE_CARD'
,p_display_name=>'Conference Card'
,p_supported_component_types=>'PARTIAL:REPORT'
,p_css_file_urls=>'#PLUGIN_FILES#css/conference_card#MIN#.css'
,p_partial_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{if APEX$IS_LAZY_LOADING/}',
'  <div></div>',
'{else/}',
'  <div class="card_wrapper #CUSTOM_CSS_CLASSES#" style="background-color: #CARD_BG_COLOUR#;">',
'    <div class="card_top" {case CARD_DESIGN/}{when 2/}style="background-color: #LOGO_BG_COLOUR#;"{otherwise/}{endcase/}></div>',
'    <div class="card_conference_logo" style="background-color: #LOGO_BG_COLOUR#;">',
'        <img src="#CONFERENCE_LOGO_URL#" style="margin-left: #LOGO_POSITION_X#; margin-top: #LOGO_POSITION_Y#;"></img>',
'    </div>',
'    <div class="card_presenter_image" style="background-image: url(#PRESENTER_IMAGE_URL#);"></div>',
'    <div class="card_data" style="color: #CARD_TEXT_COLOUR#;">',
'        <div class="speaker_data">',
'            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 300 50" style="width: 100%;height: auto; fill: #CARD_TEXT_COLOUR#;">',
'               <text class="card_person_name">#PRESENTER_NAME#</text>    ',
'               <text class="card_talk_title">#TALK_TITLE#</text>    ',
'               <text class="card_talk_time">#TALK_TIME#</text>        ',
'            </svg>',
'        </div>',
'        <div class="footer_data">',
'           <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 300 20" style="width: 100%;height: auto; fill: #CARD_TEXT_COLOUR#;">',
'            <text class="card_conference_address">#CONFERENCE_ADDRESS#</text>    ',
'            <text class="card_conference_hashtag">##CONFERENCE_HASHTAG#</text>        ',
'         </svg>',
'        </div>',
'    </div>',
'   </div>',
'{endif/}'))
,p_default_escape_mode=>'HTML'
,p_translate_this_template=>false
,p_api_version=>2
,p_report_body_template=>'<div class="card_grid" style="grid-template-columns: repeat(auto-fill, minmax(#CARD_GRID_WIDTH#, 1fr));">#APEX$ROWS#</div>'
,p_report_row_template=>'<div #APEX$ROW_IDENTIFICATION#>#APEX$PARTIAL#</div>'
,p_report_placeholder_count=>3
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_is_quick_pick=>true
,p_help_text=>'Conference Card plugin allows you to create personalized Speaker cards for any conference. It allows setting up custom logos, colours, speaker image, talk topic, etc.'
,p_version_identifier=>'1.0'
,p_files_version=>21
);
wwv_flow_imp_shared.create_plugin_attr_group(
 p_id=>wwv_flow_imp.id(9752125299803578)
,p_plugin_id=>wwv_flow_imp.id(9746674056784623)
,p_title=>'Conference settings'
,p_display_sequence=>2
);
wwv_flow_imp_shared.create_plugin_attr_group(
 p_id=>wwv_flow_imp.id(9752538046803578)
,p_plugin_id=>wwv_flow_imp.id(9746674056784623)
,p_title=>'Card settings'
,p_display_sequence=>1
);
wwv_flow_imp_shared.create_plugin_attr_group(
 p_id=>wwv_flow_imp.id(9752936647803579)
,p_plugin_id=>wwv_flow_imp.id(9746674056784623)
,p_title=>'Presenter settings'
,p_display_sequence=>3
);
wwv_flow_imp_shared.create_plugin_attr_group(
 p_id=>wwv_flow_imp.id(9753307321803579)
,p_plugin_id=>wwv_flow_imp.id(9746674056784623)
,p_title=>'Talk settings'
,p_display_sequence=>4
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9746931999784684)
,p_plugin_id=>wwv_flow_imp.id(9746674056784623)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_static_id=>'CARD_BG_COLOUR'
,p_prompt=>'Card Background Colour'
,p_attribute_type=>'COLOR'
,p_is_required=>false
,p_default_value=>'#C74634'
,p_demo_value=>'#C74634'
,p_escape_mode=>'STRIPHTML'
,p_is_translatable=>false
,p_attribute_group_id=>wwv_flow_imp.id(9752538046803578)
,p_examples=>'#C74634'
,p_help_text=>'Background colour of the Card.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9747389469784685)
,p_plugin_id=>wwv_flow_imp.id(9746674056784623)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_static_id=>'CARD_TEXT_COLOUR'
,p_prompt=>'Card Text Colour'
,p_attribute_type=>'COLOR'
,p_is_required=>false
,p_default_value=>'#FFF'
,p_demo_value=>'#FFFFFF'
,p_escape_mode=>'STRIPHTML'
,p_is_translatable=>false
,p_attribute_group_id=>wwv_flow_imp.id(9752538046803578)
,p_examples=>'#FFFFFF'
,p_help_text=>'The text colour of the card. Use HEX values.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9747745283784685)
,p_plugin_id=>wwv_flow_imp.id(9746674056784623)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_static_id=>'CONFERENCE_ADDRESS'
,p_prompt=>'Conference Address'
,p_attribute_type=>'SESSION STATE VALUE'
,p_is_required=>false
,p_demo_value=>'510 Oracle Parkway, Reading, UK'
,p_escape_mode=>'HTML'
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_attribute_group_id=>wwv_flow_imp.id(9752125299803578)
,p_examples=>'510 Oracle Parkway, Reading, UK'
,p_help_text=>'Conference location. Appears in the bottom left corner of the card.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9748185148784686)
,p_plugin_id=>wwv_flow_imp.id(9746674056784623)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_static_id=>'CONFERENCE_HASHTAG'
,p_prompt=>'Conference Hashtag'
,p_attribute_type=>'SESSION STATE VALUE'
,p_is_required=>false
,p_demo_value=>'#orclapex'
,p_escape_mode=>'HTML'
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_attribute_group_id=>wwv_flow_imp.id(9752125299803578)
,p_examples=>'#orclapex'
,p_help_text=>'Hashtag of the conference. Appears in the bottom right corner of the card.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9748503528784686)
,p_plugin_id=>wwv_flow_imp.id(9746674056784623)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_static_id=>'CONFERENCE_LOGO_URL'
,p_prompt=>'Conference Logo URL'
,p_attribute_type=>'SESSION STATE VALUE'
,p_is_required=>false
,p_escape_mode=>'HTML'
,p_column_data_types=>'VARCHAR2:CLOB'
,p_is_translatable=>false
,p_attribute_group_id=>wwv_flow_imp.id(9752125299803578)
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_FILES#conference_card/conference_logo.png',
'https://mywebsite.com/profile_picture.jpg'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'A URL of the conference logo. You can use #APP_FILES# substitutions strings too.',
'Recommended aspect ratio of the image is 1:1 (a square photo). All image formats are allowed.'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9748936239784686)
,p_plugin_id=>wwv_flow_imp.id(9746674056784623)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_static_id=>'LOGO_BG_COLOUR'
,p_prompt=>'Logo Background Colour'
,p_attribute_type=>'COLOR'
,p_is_required=>false
,p_default_value=>'#3F0B0E'
,p_demo_value=>'#3F0B0E'
,p_escape_mode=>'STRIPHTML'
,p_is_translatable=>false
,p_attribute_group_id=>wwv_flow_imp.id(9752125299803578)
,p_examples=>'#3F0B0E'
,p_help_text=>'Sets a background colour of the Logo region.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9749347533784686)
,p_plugin_id=>wwv_flow_imp.id(9746674056784623)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_static_id=>'LOGO_POSITION_X'
,p_prompt=>'Logo Position X'
,p_attribute_type=>'SESSION STATE VALUE'
,p_is_required=>false
,p_default_value=>'-25%'
,p_demo_value=>'-25%'
,p_escape_mode=>'HTML'
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_attribute_group_id=>wwv_flow_imp.id(9752125299803578)
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-25%',
'35px',
'2rem'))
,p_help_text=>'Helps position the Logo horizontally. You can use %, px, er, rem, etc. units.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9749715288784687)
,p_plugin_id=>wwv_flow_imp.id(9746674056784623)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_static_id=>'LOGO_POSITION_Y'
,p_prompt=>'Logo Position Y'
,p_attribute_type=>'SESSION STATE VALUE'
,p_is_required=>false
,p_default_value=>'0%'
,p_demo_value=>'0%'
,p_escape_mode=>'HTML'
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_attribute_group_id=>wwv_flow_imp.id(9752125299803578)
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'10px',
'2rem',
'3em',
'40%'))
,p_help_text=>'Helps position Logo vertically. You can use %, px, er, rem, etc. units.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9750169968784687)
,p_plugin_id=>wwv_flow_imp.id(9746674056784623)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>90
,p_static_id=>'PRESENTER_IMAGE_URL'
,p_prompt=>'Presenter Image URL'
,p_attribute_type=>'SESSION STATE VALUE'
,p_is_required=>false
,p_escape_mode=>'STRIPHTML'
,p_column_data_types=>'VARCHAR2:CLOB'
,p_is_translatable=>false
,p_attribute_group_id=>wwv_flow_imp.id(9752936647803579)
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_FILES#conference_card/profile_400x400.jpeg',
'https://mywebsite.com/profile_picture.png'))
,p_help_text=>'A URL of the speaker picture. You can use #APP_FILES# substitutions strings too. An aspect ratio of 1:1 (square image) is preferred.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9750588822784687)
,p_plugin_id=>wwv_flow_imp.id(9746674056784623)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>100
,p_static_id=>'PRESENTER_NAME'
,p_prompt=>'Presenter Name'
,p_attribute_type=>'SESSION STATE VALUE'
,p_is_required=>false
,p_escape_mode=>'HTML'
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_attribute_group_id=>wwv_flow_imp.id(9752936647803579)
,p_examples=>'Plamen Mushkov'
,p_help_text=>'Name of the speaker. Appears below the profile picture in bold.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9750952326784687)
,p_plugin_id=>wwv_flow_imp.id(9746674056784623)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>110
,p_static_id=>'TALK_TIME'
,p_prompt=>'Talk Time'
,p_attribute_type=>'SESSION STATE VALUE'
,p_is_required=>false
,p_escape_mode=>'HTML'
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_attribute_group_id=>wwv_flow_imp.id(9753307321803579)
,p_help_text=>'Description of the room, date and time of the talk. Appears below the Talk title.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9751374590784688)
,p_plugin_id=>wwv_flow_imp.id(9746674056784623)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>12
,p_display_sequence=>120
,p_static_id=>'TALK_TITLE'
,p_prompt=>'Talk Title'
,p_attribute_type=>'SESSION STATE VALUE'
,p_is_required=>false
,p_escape_mode=>'HTML'
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_attribute_group_id=>wwv_flow_imp.id(9753307321803579)
,p_examples=>'What''s new in APEX 23.2'
,p_help_text=>'Talk title. Appears below the speaker name on the card.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9837986375431248)
,p_plugin_id=>wwv_flow_imp.id(9746674056784623)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>14
,p_display_sequence=>140
,p_static_id=>'CARD_DESIGN'
,p_prompt=>'Card Design'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_default_value=>'1'
,p_demo_value=>'1'
,p_escape_mode=>'HTML'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Pick a design for your card. Currently supported are the Credit Card Style Design and Linkedin Style Design.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9838255200434301)
,p_plugin_attribute_id=>wwv_flow_imp.id(9837986375431248)
,p_display_sequence=>10
,p_display_value=>'Credit Card Style'
,p_return_value=>'1'
,p_is_quick_pick=>true
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(9838688691435839)
,p_plugin_attribute_id=>wwv_flow_imp.id(9837986375431248)
,p_display_sequence=>20
,p_display_value=>'Linkedin Style'
,p_return_value=>'2'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9855588915968432)
,p_plugin_id=>wwv_flow_imp.id(9746674056784623)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>15
,p_display_sequence=>150
,p_static_id=>'CUSTOM_CSS_CLASSES'
,p_prompt=>'Custom CSS Classes'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_escape_mode=>'HTML'
,p_is_translatable=>false
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'padding-sm',
'margin-left-md margin-right-md',
'my_custom_css_class'))
,p_help_text=>'You can any CSS classes here, separated by a space. They are applied at the card_wrapper DIV element.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(9835421565089159)
,p_plugin_id=>wwv_flow_imp.id(9746674056784623)
,p_attribute_scope=>'REPORT'
,p_attribute_sequence=>13
,p_display_sequence=>130
,p_static_id=>'CARD_GRID_WIDTH'
,p_prompt=>'Card Width'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'300px'
,p_demo_value=>'300px'
,p_escape_mode=>'HTML'
,p_is_translatable=>false
,p_attribute_group_id=>wwv_flow_imp.id(9752538046803578)
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'300px',
'30rem',
'20%'))
,p_help_text=>'The width of a single card when you display more than one. The cards are displayed in a grid and the number of cards on row is automatically changed, depending on the width you specify.'
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '40696D706F72742075726C282768747470733A2F2F666F6E74732E676F6F676C65617069732E636F6D2F637373323F66616D696C793D496E7465723A77676874403230303B3430303B3630303B3830302666616D696C793D526F626F746F2B5365726966';
wwv_flow_imp.g_varchar2_table(2) := '3A6F70737A2C7767687440382E2E3134342C3130302666616D696C793D526F626F746F3A776768744031303026646973706C61793D7377617027293B0A0A2F2A202520756E697473202A2F0A2E636172645F77726170706572207B0A2020202D2D636172';
wwv_flow_imp.g_varchar2_table(3) := '642D77696474683A20313030253B0A2020202D2D6176617461722D77696474683A2063616C6328766172282D2D636172642D7769647468292A302E3237293B200A7D0A2E636172645F746F70207B0A2020206865696768743A2063616C6328766172282D';
wwv_flow_imp.g_varchar2_table(4) := '2D636172642D776964746829202A20392F3136202A20302E3330293B0A7D0A2E636172645F636F6E666572656E63655F6C6F676F207B0A2020206865696768743A2063616C6328766172282D2D636172642D776964746829202A20392F3136202A20302E';
wwv_flow_imp.g_varchar2_table(5) := '3438293B0A2020206261636B67726F756E642D706F736974696F6E2D783A20302E31253B0A7D0A2E636172645F70726573656E7465725F696D616765207B200A2020206C6566743A2063616C6328766172282D2D636172642D776964746829202A20302E';
wwv_flow_imp.g_varchar2_table(6) := '3034293B0A202020746F703A2063616C6328766172282D2D636172642D776964746829202A20392F3136202A20302E31293B0A7D0A2E737065616B65725F646174612C0A2E636172645F636F6E666572656E63655F616464726573732C0A2E666F6F7465';
wwv_flow_imp.g_varchar2_table(7) := '725F64617461207B0A2020206C6566743A2063616C6328766172282D2D636172642D776964746829202A20302E303535293B200A7D0A2E737065616B65725F646174612C0A2E666F6F7465725F64617461207B0A202020746F703A2063616C6328766172';
wwv_flow_imp.g_varchar2_table(8) := '282D2D636172642D776964746829202A20392F3136202A20302E35293B0A7D0A2E636172645F706572736F6E5F6E616D65207B0A202020666F6E742D73697A653A2063616C632831307078202B20312E347677293B0A7D0A2E636172645F74616C6B5F74';
wwv_flow_imp.g_varchar2_table(9) := '69746C65207B0A202020666F6E742D73697A653A2063616C632831307078202B20317677293B0A7D0A2E636172645F74616C6B5F74696D65207B0A202020666F6E742D73697A653A2063616C632831307078202B20302E387677293B0A7D0A2E63617264';
wwv_flow_imp.g_varchar2_table(10) := '5F636F6E666572656E63655F616464726573732C0A2E636172645F636F6E666572656E63655F68617368746167207B0A202020666F6E742D73697A653A2063616C632831307078202B20302E367677293B0A7D0A2E636172645F636F6E666572656E6365';
wwv_flow_imp.g_varchar2_table(11) := '5F68617368746167207B0A20202072696768743A2063616C6328766172282D2D636172642D776964746829202A20302E303535293B0A7D0A0A406D6564696120286D61782D77696474683A20373637707829207B0A2020202E636172645F706572736F6E';
wwv_flow_imp.g_varchar2_table(12) := '5F6E616D65207B0A202020202020666F6E742D73697A653A2063616C6328357078202B20327677293B0A2020207D0A2020202E636172645F74616C6B5F7469746C65207B0A202020202020666F6E742D73697A653A2063616C6328357078202B20312E34';
wwv_flow_imp.g_varchar2_table(13) := '7677293B0A2020207D0A2020202E636172645F74616C6B5F74696D65207B0A202020202020666F6E742D73697A653A2063616C6328357078202B20312E327677293B0A2020207D0A7D0A2F2A20656E64206F66202520756E697473202A2F0A0A2E636172';
wwv_flow_imp.g_varchar2_table(14) := '645F67726964207B0A202020646973706C61793A20677269643B0A202020677269642D6761703A203172656D3B200A202020677269642D74656D706C6174652D636F6C756D6E733A20726570656174286175746F2D66696C6C2C206D696E6D6178283330';
wwv_flow_imp.g_varchar2_table(15) := '3070782C2031667229293B0A7D0A0A2E636172645F77726170706572207B0A202020666F6E742D66616D696C793A2022496E746572222C2073616E732D73657269663B0A202020706F736974696F6E3A2072656C61746976653B0A20202077696474683A';
wwv_flow_imp.g_varchar2_table(16) := '20766172282D2D636172642D7769647468293B0A2020206D696E2D77696474683A2032303070783B0A2020206D61782D77696474683A2038303070783B0A2020206173706563742D726174696F3A203136202F20393B0A202020626F726465723A203570';
wwv_flow_imp.g_varchar2_table(17) := '78202366666620736F6C69643B0A202020626F726465722D7261646975733A20313670783B0A0A2020206261636B67726F756E642D636F6C6F723A20234337343633343B0A202020626F782D736861646F773A2032707820327078203130707820236363';
wwv_flow_imp.g_varchar2_table(18) := '633B0A7D0A0A2E636172645F746F70207B0A20202077696474683A20313030253B0A202020626F726465722D7261646975733A2031307078203130707820307078203070783B0A7D0A0A2E636172645F636F6E666572656E63655F6C6F676F207B0A2020';
wwv_flow_imp.g_varchar2_table(19) := '2077696474683A20313030253B0A2020206261636B67726F756E642D636F6C6F723A20233346304230453B0A2020206F766572666C6F773A2068696464656E3B0A7D0A0A2E636172645F636F6E666572656E63655F6C6F676F20696D67207B0A20202077';
wwv_flow_imp.g_varchar2_table(20) := '696474683A206175746F3B200A2020206865696768743A20313030253B0A7D0A0A2E636172645F64617461207B0A20202077696474683A20313030253B0A2020206865696768743A2063616C6328766172282D2D636172642D776964746829202A20392F';
wwv_flow_imp.g_varchar2_table(21) := '3136202A20302E3830293B0A202020626F726465722D7261646975733A2030707820307078203133707820313370783B0A0A202020636F6C6F723A20236666663B0A7D0A0A2E636172645F70726573656E7465725F696D616765207B200A202020776964';
wwv_flow_imp.g_varchar2_table(22) := '74683A20766172282D2D6176617461722D7769647468293B0A2020206173706563742D726174696F3A2031202F20313B0A202020626F726465723A20302E333572656D202366666620736F6C69643B0A202020706F736974696F6E3A206162736F6C7574';
wwv_flow_imp.g_varchar2_table(23) := '653B0A2020206261636B67726F756E642D636F6C6F723A20236566656665663B0A202020626F726465722D7261646975733A20313872656D3B0A2020206261636B67726F756E642D73697A653A20636F7665723B0A2020206261636B67726F756E642D70';
wwv_flow_imp.g_varchar2_table(24) := '6F736974696F6E3A2063656E7465723B0A7D0A0A2E737065616B65725F646174612C0A2E666F6F7465725F64617461207B0A202020706F736974696F6E3A2072656C61746976653B0A202020626F74746F6D3A203670783B0A7D0A0A2E636172645F636F';
wwv_flow_imp.g_varchar2_table(25) := '6E666572656E63655F616464726573732C202E636172645F636F6E666572656E63655F68617368746167207B0A202020706F736974696F6E3A206162736F6C7574653B0A7D200A2E636172645F706572736F6E5F6E616D65207B0A202020666F6E742D77';
wwv_flow_imp.g_varchar2_table(26) := '65696768743A203830303B0A7D0A2E636172645F74616C6B5F7469746C65207B0A202020666F6E742D7765696768743A203430303B200A7D0A2E636172645F74616C6B5F74696D65207B0A202020666F6E742D7765696768743A203230303B0A7D0A2E63';
wwv_flow_imp.g_varchar2_table(27) := '6172645F636F6E666572656E63655F616464726573732C0A2E636172645F636F6E666572656E63655F68617368746167207B0A202020626F74746F6D3A2033253B0A202020666F6E742D7765696768743A203230303B0A7D0A0A73766720746578742E63';
wwv_flow_imp.g_varchar2_table(28) := '6172645F706572736F6E5F6E616D65207B0A2020207472616E73666F726D3A207472616E736C617465283070782C2031337078293B0A202020666F6E742D73697A653A20302E373572656D3B0A7D0A73766720746578742E636172645F74616C6B5F7469';
wwv_flow_imp.g_varchar2_table(29) := '746C65207B0A2020207472616E73666F726D3A207472616E736C617465283070782C2032367078293B0A202020666F6E742D73697A653A20302E36323572656D3B0A7D0A73766720746578742E636172645F74616C6B5F74696D65207B0A202020747261';
wwv_flow_imp.g_varchar2_table(30) := '6E73666F726D3A207472616E736C617465283070782C2033367078293B0A202020666F6E742D73697A653A20302E3572656D3B0A7D0A0A73766720746578742E636172645F636F6E666572656E63655F61646472657373207B0A2020207472616E73666F';
wwv_flow_imp.g_varchar2_table(31) := '726D3A207472616E736C617465283070782C20367078293B0A202020666F6E742D73697A653A20302E3572656D3B0A7D0A73766720746578742E636172645F636F6E666572656E63655F68617368746167207B0A2020207472616E73666F726D3A207472';
wwv_flow_imp.g_varchar2_table(32) := '616E736C6174652831383470782C20367078293B0A202020666F6E742D73697A653A20302E3572656D3B0A7D';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(9753712244809431)
,p_plugin_id=>wwv_flow_imp.id(9746674056784623)
,p_file_name=>'css/conference_card.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '40696D706F72742075726C2868747470733A2F2F666F6E74732E676F6F676C65617069732E636F6D2F637373323F66616D696C793D496E7465723A77676874403230303B3430303B3630303B3830302666616D696C793D526F626F746F2B53657269663A';
wwv_flow_imp.g_varchar2_table(2) := '6F70737A2C7767687440382E2E3134342C3130302666616D696C793D526F626F746F3A776768744031303026646973706C61793D73776170293B2E636172645F777261707065727B2D2D636172642D77696474683A313030253B2D2D6176617461722D77';
wwv_flow_imp.g_varchar2_table(3) := '696474683A63616C6328766172282D2D636172642D7769647468292A302E3237297D2E636172645F746F707B6865696768743A63616C6328766172282D2D636172642D7769647468292A392F31362A2E33297D2E636172645F636F6E666572656E63655F';
wwv_flow_imp.g_varchar2_table(4) := '6C6F676F7B6865696768743A63616C6328766172282D2D636172642D7769647468292A392F31362A2E3438293B6261636B67726F756E642D706F736974696F6E2D783A2E31257D2E636172645F70726573656E7465725F696D6167657B6C6566743A6361';
wwv_flow_imp.g_varchar2_table(5) := '6C6328766172282D2D636172642D7769647468292A2E3034293B746F703A63616C6328766172282D2D636172642D7769647468292A392F31362A2E31297D2E636172645F636F6E666572656E63655F616464726573732C2E666F6F7465725F646174612C';
wwv_flow_imp.g_varchar2_table(6) := '2E737065616B65725F646174617B6C6566743A63616C6328766172282D2D636172642D7769647468292A2E303535297D2E666F6F7465725F646174612C2E737065616B65725F646174617B746F703A63616C6328766172282D2D636172642D7769647468';
wwv_flow_imp.g_varchar2_table(7) := '292A392F31362A2E35297D2E636172645F706572736F6E5F6E616D657B666F6E742D73697A653A63616C632831307078202B20312E347677297D2E636172645F74616C6B5F7469746C657B666F6E742D73697A653A63616C632831307078202B20317677';
wwv_flow_imp.g_varchar2_table(8) := '297D2E636172645F74616C6B5F74696D657B666F6E742D73697A653A63616C632831307078202B202E387677297D2E636172645F636F6E666572656E63655F616464726573732C2E636172645F636F6E666572656E63655F686173687461677B666F6E74';
wwv_flow_imp.g_varchar2_table(9) := '2D73697A653A63616C632831307078202B202E367677297D2E636172645F636F6E666572656E63655F686173687461677B72696768743A63616C6328766172282D2D636172642D7769647468292A2E303535297D406D6564696120286D61782D77696474';
wwv_flow_imp.g_varchar2_table(10) := '683A3736377078297B2E636172645F706572736F6E5F6E616D657B666F6E742D73697A653A63616C6328357078202B20327677297D2E636172645F74616C6B5F7469746C657B666F6E742D73697A653A63616C6328357078202B20312E347677297D2E63';
wwv_flow_imp.g_varchar2_table(11) := '6172645F74616C6B5F74696D657B666F6E742D73697A653A63616C6328357078202B20312E327677297D7D2E636172645F677269647B646973706C61793A677269643B677269642D6761703A3172656D3B677269642D74656D706C6174652D636F6C756D';
wwv_flow_imp.g_varchar2_table(12) := '6E733A726570656174286175746F2D66696C6C2C6D696E6D61782833303070782C31667229297D2E636172645F777261707065727B666F6E742D66616D696C793A22496E746572222C73616E732D73657269663B706F736974696F6E3A72656C61746976';
wwv_flow_imp.g_varchar2_table(13) := '653B77696474683A766172282D2D636172642D7769647468293B6D696E2D77696474683A32303070783B6D61782D77696474683A38303070783B6173706563742D726174696F3A31362F393B626F726465723A357078202366666620736F6C69643B626F';
wwv_flow_imp.g_varchar2_table(14) := '726465722D7261646975733A313670783B6261636B67726F756E642D636F6C6F723A236337343633343B626F782D736861646F773A32707820327078203130707820236363637D2E636172645F746F707B77696474683A313030253B626F726465722D72';
wwv_flow_imp.g_varchar2_table(15) := '61646975733A313070782031307078203020307D2E636172645F636F6E666572656E63655F6C6F676F7B77696474683A313030253B6261636B67726F756E642D636F6C6F723A233366306230653B6F766572666C6F773A68696464656E7D2E636172645F';
wwv_flow_imp.g_varchar2_table(16) := '636F6E666572656E63655F6C6F676F20696D677B77696474683A6175746F3B6865696768743A313030257D2E636172645F646174617B77696474683A313030253B6865696768743A63616C6328766172282D2D636172642D7769647468292A392F31362A';
wwv_flow_imp.g_varchar2_table(17) := '2E38293B626F726465722D7261646975733A302030203133707820313370783B636F6C6F723A236666667D2E636172645F70726573656E7465725F696D6167657B77696474683A766172282D2D6176617461722D7769647468293B6173706563742D7261';
wwv_flow_imp.g_varchar2_table(18) := '74696F3A312F313B626F726465723A2E333572656D202366666620736F6C69643B706F736974696F6E3A6162736F6C7574653B6261636B67726F756E642D636F6C6F723A236566656665663B626F726465722D7261646975733A313872656D3B6261636B';
wwv_flow_imp.g_varchar2_table(19) := '67726F756E642D73697A653A636F7665723B6261636B67726F756E642D706F736974696F6E3A63656E7465727D2E666F6F7465725F646174612C2E737065616B65725F646174617B706F736974696F6E3A72656C61746976653B626F74746F6D3A367078';
wwv_flow_imp.g_varchar2_table(20) := '7D2E636172645F636F6E666572656E63655F616464726573732C2E636172645F636F6E666572656E63655F686173687461677B706F736974696F6E3A6162736F6C7574657D2E636172645F706572736F6E5F6E616D657B666F6E742D7765696768743A38';
wwv_flow_imp.g_varchar2_table(21) := '30307D2E636172645F74616C6B5F7469746C657B666F6E742D7765696768743A3430307D2E636172645F74616C6B5F74696D657B666F6E742D7765696768743A3230307D2E636172645F636F6E666572656E63655F616464726573732C2E636172645F63';
wwv_flow_imp.g_varchar2_table(22) := '6F6E666572656E63655F686173687461677B626F74746F6D3A33253B666F6E742D7765696768743A3230307D73766720746578742E636172645F706572736F6E5F6E616D657B7472616E73666F726D3A7472616E736C61746528302C31337078293B666F';
wwv_flow_imp.g_varchar2_table(23) := '6E742D73697A653A2E373572656D7D73766720746578742E636172645F74616C6B5F7469746C657B7472616E73666F726D3A7472616E736C61746528302C32367078293B666F6E742D73697A653A2E36323572656D7D73766720746578742E636172645F';
wwv_flow_imp.g_varchar2_table(24) := '74616C6B5F74696D657B7472616E73666F726D3A7472616E736C61746528302C33367078293B666F6E742D73697A653A2E3572656D7D73766720746578742E636172645F636F6E666572656E63655F616464726573737B7472616E73666F726D3A747261';
wwv_flow_imp.g_varchar2_table(25) := '6E736C61746528302C367078293B666F6E742D73697A653A2E3572656D7D73766720746578742E636172645F636F6E666572656E63655F686173687461677B7472616E73666F726D3A7472616E736C6174652831383470782C367078293B666F6E742D73';
wwv_flow_imp.g_varchar2_table(26) := '697A653A2E3572656D7D';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(9856796019047146)
,p_plugin_id=>wwv_flow_imp.id(9746674056784623)
,p_file_name=>'css/conference_card.min.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
