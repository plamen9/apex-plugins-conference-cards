# Conference Cards Template Component for Oracle APEX
[![APEX Community](https://cdn.rawgit.com/Dani3lSun/apex-github-badges/78c5adbe/badges/apex-community-badge.svg)](https://apex.oracle.com/pls/apex/r/gamma_dev/demo/) [![APEX Plugin](https://cdn.rawgit.com/Dani3lSun/apex-github-badges/b7e95341/badges/apex-plugin-badge.svg)](https://apex.oracle.com/pls/apex/r/gamma_dev/demo/)
[![APEX Built with Love](https://cdn.rawgit.com/Dani3lSun/apex-github-badges/7919f913/badges/apex-love-badge.svg)](https://apex.oracle.com/pls/apex/r/gamma_dev/demo/)

## Description
A Template Component for Oracle APEX (23.1 and above). Conference Card plugin allows you to create personalized Speaker cards for any conference. You can set up custom logos, colours, speaker image, talk topic, etc.

## Notes
- The Card takes 100% of the container it is put into. The maximum width of the card is set to 800px. If you want to modify it further, feel free to change the max-width property of the **card_wrapper** CSS class.
- When used as a Multiple (Report), you can additionally set the width of a card. The number of cards, displayed in a row will be automatically calculated based on the card width. 

## Demo Application
[https://apex.oracle.com/pls/apex/r/gamma_dev/demo/conference-cards-plugin-demo](https://apex.oracle.com/pls/apex/r/gamma_dev/demo/conference-cards-plugin-demo)

## Installation
- Import plugin file "conference_cards_plugin.sql" from source directory into your application
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
