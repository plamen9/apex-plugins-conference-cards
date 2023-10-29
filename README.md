# Conference Cards Template Component for APEX
[![APEX Community](https://cdn.rawgit.com/Dani3lSun/apex-github-badges/78c5adbe/badges/apex-community-badge.svg)](https://apex.oracle.com/pls/apex/r/gamma_dev/demo/) [![APEX Plugin](https://cdn.rawgit.com/Dani3lSun/apex-github-badges/b7e95341/badges/apex-plugin-badge.svg)](https://apex.oracle.com/pls/apex/r/gamma_dev/demo/)
[![APEX Built with Love](https://cdn.rawgit.com/Dani3lSun/apex-github-badges/7919f913/badges/apex-love-badge.svg)](https://apex.oracle.com/pls/apex/r/gamma_dev/demo/)

## Preview
![Conference Cards in each of the two available designs](https://raw.githubusercontent.com/plamen9/apex-plugins-conference-cards/main/demo_1.jpg "Conference Cards in each of the two available designs")

## Description
A Template Component for Oracle APEX (23.1 and above). Conference Card plugin allows you to create personalized Speaker cards for any conference. You can set up custom logos, colours, speaker image, talk topic, etc.

## Notes
- The Card takes 100% of the container it is put into. The maximum width of the card is set to 800px. If you want to modify it further, feel free to change the max-width property of the **card_wrapper** CSS class.
- When used as a Multiple (Report), you can additionally set the width of a card. The number of cards, displayed in a row will be automatically calculated based on the card width. 

## Demo Application
[https://apex.oracle.com/pls/apex/r/gamma_dev/demo/conference-cards-plugin-demo](https://apex.oracle.com/pls/apex/r/gamma_dev/demo/conference-cards-plugin-demo)

## Installation
- Import plugin file "conference_cards_plugin.sql" into your application
- (Optional) Deploy the image and CSS/JS files from "server" directory on your webserver and change the "File Prefix" to web servers folder (Inside the Plugin Settings).

## Usage
🔸 As a `Partial (Single)`
- Create a new Region of type `Conference Card`. You can use any type of source for the data. Here is an example of a `SQL Query`:
```sql
select
    'Plamen Mushkov' PRESENTER_NAME,
    'The rise of the APEX apps' TALK_TITLE,
    'Mon, 26 June, 12:00 | Ballroom 3' TALK_TIME, 
    'Aurora, Colorado' CONFERENCE_ADDRESS,
    'Kscope23' CONFERENCE_HASHTAG,
    '#APP_FILES#my_dummy_folder/speaker_avatar.png' PRESENTER_IMAGE_URL,
    '#APP_FILES#my_dummy_folder/conference_logo.png' CONFERENCE_LOGO_URL,
    '-25%' LOGO_POSITION_X,
    0 LOGO_POSITION_Y
from dual;
```
- Go to the Region `Attributes` section. From `Appearance` \ `Diisplay` select `Partial (Single)`.
- Map the query columns to the relevant attributes from the list (full list of options and their description - below).

🔸 As a `Multiple (Report)`
- Create a new Region of type `Conference Card`. You can use any type of source for the data. Here is an example of a `SQL Query`:
```sql
select PRESENTER_NAME, TALK_TITLE, TALK_TIME, CONFERENCE_ADDRESS,
       CONFERENCE_HASHTAG, PRESENTER_IMAGE_URL, CONFERENCE_LOGO_URL,
       LOGO_POSITION_X, LOGO_POSITION_Y
from conference_details
where conference = 'Kscope23';
```
> **Sample text for the each column can be found in the previous example.*
- Go to the Region `Attributes` section. From `Appearance` \ `Diisplay` select `Multiple (Report)`.
- Map the query columns to the relevant attributes from the list (full list of options and their description - below).
- You can optionally set the `Card Width` attribute, which is only available in this mode and controls the width of a card and the number of cards per row.

🔸 As a column in a `Classic Report`, `Interactive Report` or `Interactive Grid`
- Create a new Region of type `Classic Report`, `Interactive Report` or `Interactive Grid`.  You can use any type of source for the data. Here is an example of a `SQL Query`:
```sql
select some_table_column1, some_table_column2, some_table_column3,
       PRESENTER_NAME, TALK_TITLE, TALK_TIME, CONFERENCE_ADDRESS,
       CONFERENCE_HASHTAG, PRESENTER_IMAGE_URL, CONFERENCE_LOGO_URL,
       LOGO_POSITION_X, LOGO_POSITION_Y,
       null card_details
from conference_details
where conference = 'Kscope23';
```
- The column, named `card_details` (or any other name that you choose to use) should be of type `Conference Card`.
- After changing the type to `Conference Card`, all of the Attributes for the Tempalte Component will be available below.
- Map the query columns to the relevant attributes from the list, similar to the previous two scenarios (full list of options and their description - below).
> **Note that the Cards will have a CSS property `min-width` set to 200px, as card is useles if it's less that that. Otherwise, the Card always takes 100% of the container it belongs to (in this case the report cell).*

## Attributes
| Attribute  | Description  | Examples |
|---|---|---|
| Card Width | The width of a single card when you display more than one. The cards are displayed in a grid and the number of cards on row is automatically changed, depending on the width you specify.  | 300px </br> 30rem </br> 20% | 
| Card Design | Pick a design for your card. Currently supported are the Credit Card Style Design and Linkedin Style Design.  | Credit Card Style </br> Linkedin Style  | 
| Custom CSS Classes  | You can any CSS classes here, separated by a space. They are applied at the card_wrapper DIV element.  | padding-sm </br> margin-left-md margin-right-md </br>  my_custom_css_class  |
| Card Background Colour | Background colour of the Card. | #C74634 |
| Card Text Colour | The text colour of the card. Use HEX values. | #FFFFFF |
| Conference Address | Conference location. Appears in the bottom left corner of the card. | 510 Oracle Parkway, Reading, UK |
| Conference Hashtag | Hashtag of the conference. Appears in the bottom right corner of the card. | orclapex |
| Conference Logo URL | A URL of the conference logo. You can use #APP_FILES# substitutions strings too. </br>
Recommended aspect ratio of the image is 1:1 (a square photo). All image formats are allowed. | #APP_FILES#conference_card/conference_logo.png </br>
https://mywebsite.com/profile_picture.jpg |
| Logo Background Colour | Sets a background colour of the Logo region. | #3F0B0E |
| Logo Position X | Helps position the Logo horizontally. You can use %, px, er, rem, etc. units. | 25% </br> 35px </br> 2rem |
| Logo Position Y | Helps position Logo vertically. You can use %, px, er, rem, etc. units. | 25% </br> 35px </br> 2rem |
| Presenter Name | Name of the speaker. Appears below the profile picture in bold. | Plamen Mushkov |
| Presenter Image URL | A URL of the speaker picture. You can use #APP_FILES# substitutions strings too. An aspect ratio of 1:1 (square image) is preferred. | #APP_FILES#conference_card/profile_400x400.jpeg </br>
https://mywebsite.com/profile_picture.png |
| Talk Title | Talk title. Appears below the speaker name on the card. | Starting big with Template Components |
| Talk Time | Description of the room, date and time of the talk. Appears below the Talk title. | Mon, 26 June, 17:30 | Ballroom 3 |

## How it's made
Curios to see how to build such a Template Component Plugin from scratch? </br>
Click on the link below and check my blog post ⤵️

[![From Prototype to Great Application Component](https://cdn.hashnode.com/res/hashnode/image/upload/v1698171884930/8b330d44-8407-43fd-bc79-a33f04e4a886.png?w=600&h=315&fit=crop&crop=entropy&auto=compress,format&format=webp')](https://blog.apexapplab.dev/from-prototype-to-great-application-component)

