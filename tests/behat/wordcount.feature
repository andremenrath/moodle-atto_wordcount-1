@editor @editor_atto @atto @atto_wordcount @atto_media @_file_upload
Feature: Atto wordcount button
  To add words count to Atto editor, I need to use the wordcount button.

  Background:
    Given I log in as "admin"
    And I navigate to "Plugins > Text editors > Atto HTML editor" in site administration
    And I set the field "s_editor_atto_toolbar" to multiline:
    """
    collapse = collapse
    style1 = title, bold, italic
    list = unorderedlist, orderedlist, indent
    links = link
    files = emojipicker, image, media, recordrtc, managefiles, h5p
    style2 = underline, strike, subscript, superscript
    align = align
    insert = equation, charmap, table, clear
    undo = undo
    accessibility = accessibilitychecker, accessibilityhelper
    other = html,wordcount
    """
    And I press "Save changes"

  @javascript
  Scenario: Count words on atto is Zero
    Given I open my profile in edit mode
    And I wait until the page is ready
    And I click on "Show more buttons" "button"
    And I click on "HTML" "button"
    And I set the field "Description" to "<p></p>"
    When I click on "HTML" "button"
    Then I should see "Words: 0"

  @javascript
  Scenario: Count words on atto is Words only
    Given I open my profile in edit mode
    And I wait until the page is ready
    And I click on "Show more buttons" "button"
    And I click on "HTML" "button"
    And I set the field "Description" to multiline:
    """
        <p dir="ltr" style="text-align: left;"></p>
    <pre></pre>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam aliquet, metus at euismod porttitor, arcu velit dictum libero, in egestas diam purus in nibh. Donec congue enim pretium, accumsan justo sed, interdum mauris. Donec vestibulum lectus sed arcu convallis, vitae ultricies lorem ultricies. Morbi rhoncus est eget massa lobortis aliquet. Praesent porttitor ex in mi mollis condimentum. Proin eu mi malesuada sapien mollis venenatis nec sit amet dolor. Maecenas ornare felis vel viverra condimentum. Fusce lacinia tempor metus, a gravida metus bibendum ut. Sed mi velit, luctus at nisl vel, feugiat rhoncus nunc. Quisque at ligula et nunc sagittis dictum. Sed luctus lectus sit amet urna congue bibendum. Donec lobortis mi a magna suscipit, id gravida nibh malesuada. Vivamus luctus elit massa, tincidunt iaculis lacus blandit sit amet. Pellentesque semper elit ac varius commodo. Integer semper ex in ex convallis, at egestas arcu efficitur.</p>
    <p>Donec sed ligula vitae quam tristique varius. Quisque consectetur elementum elit ac euismod. Ut rhoncus arcu nec dictum viverra. Nam vel tristique lacus, id venenatis urna. Morbi condimentum ipsum et faucibus ullamcorper. Phasellus ut velit suscipit, congue tortor ac, molestie libero. Pellentesque non scelerisque nisl. Quisque nec pulvinar augue, eu gravida augue. Sed ullamcorper lorem eu lacus molestie, a mattis dui porttitor. Suspendisse vehicula elementum luctus. Praesent luctus eros sit amet auctor imperdiet. Mauris fringilla nisi massa, nec iaculis magna tempus vitae. Praesent suscipit tortor a lectus ultrices, sit amet condimentum sem imperdiet. Donec quis rutrum dolor. Duis ut nisl ac arcu maximus fermentum.</p>
    <p>Aenean mi metus, eleifend at gravida eget, blandit quis mi. Nunc mauris elit, malesuada nec tortor et, tempor cursus sapien. Curabitur facilisis malesuada mauris, in porttitor nunc tristique at. Fusce et nisi at nibh imperdiet vehicula nec in orci. Duis arcu velit, pulvinar a mauris volutpat, lobortis scelerisque urna. Suspendisse et lectus congue, pharetra enim eu, ultricies dolor. Maecenas arcu sem, iaculis ac lobortis et, vulputate in lacus. Nam non turpis fringilla, ornare lacus bibendum, eleifend purus. Aenean accumsan quam vitae eros placerat aliquam sed a orci. Suspendisse sed sodales magna. Nunc feugiat, magna eget ornare suscipit, nulla urna scelerisque tortor, vel facilisis lectus felis sed enim. Aliquam fermentum blandit nisi ac aliquam.</p>
    <p>Duis pellentesque massa turpis, eu tincidunt augue feugiat nec. Vivamus fermentum ornare diam, in rutrum neque. Suspendisse enim dolor, finibus finibus finibus at, semper vitae purus. In porttitor mi vitae nisi maximus, at vehicula mauris sagittis. Nullam quis blandit risus, quis imperdiet enim. Nulla blandit dignissim lacus. Fusce et vestibulum mauris. Fusce et metus id enim consequat gravida vel sit amet erat. Sed et arcu lectus. Class.</p><br>
    <p></p>
    """
    When I click on "HTML" "button"
    Then I should see "Words: 428"

  @javascript
  Scenario: Count words on atto is Words With Multimedia
    Given I am on homepage
    And I follow "Manage private files..."
    And I upload "lib/editor/atto/tests/fixtures/moodle-logo.webm" file to "Files" filemanager
    And I upload "lib/editor/atto/tests/fixtures/moodle-logo.mp4" file to "Files" filemanager
    And I upload "lib/editor/atto/tests/fixtures/moodle-logo.png" file to "Files" filemanager
    And I upload "lib/editor/atto/tests/fixtures/pretty-good-en.vtt" file to "Files" filemanager
    And I upload "lib/editor/atto/tests/fixtures/pretty-good-sv.vtt" file to "Files" filemanager
    And I click on "Save changes" "button"
    And I open my profile in edit mode
    And I wait until the page is ready
    And I click on "Show more buttons" "button"
    And I click on "HTML" "button"
    And I set the field "Description" to multiline:
    """
        <p dir="ltr" style="text-align: left;"></p>
    <pre></pre>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam aliquet, metus at euismod porttitor, arcu velit dictum libero, in egestas diam purus in nibh. Donec congue enim pretium, accumsan justo sed, interdum mauris. Donec vestibulum lectus sed arcu convallis, vitae ultricies lorem ultricies. Morbi rhoncus est eget massa lobortis aliquet. Praesent porttitor ex in mi mollis condimentum. Proin eu mi malesuada sapien mollis venenatis nec sit amet dolor. Maecenas ornare felis vel viverra condimentum. Fusce lacinia tempor metus, a gravida metus bibendum ut. Sed mi velit, luctus at nisl vel, feugiat rhoncus nunc. Quisque at ligula et nunc sagittis dictum. Sed luctus lectus sit amet urna congue bibendum. Donec lobortis mi a magna suscipit, id gravida nibh malesuada. Vivamus luctus elit massa, tincidunt iaculis lacus blandit sit amet. Pellentesque semper elit ac varius commodo. Integer semper ex in ex convallis, at egestas arcu efficitur.</p>
    <p>Donec sed ligula vitae quam tristique varius. Quisque consectetur elementum elit ac euismod. Ut rhoncus arcu nec dictum viverra. Nam vel tristique lacus, id venenatis urna. Morbi condimentum ipsum et faucibus ullamcorper. Phasellus ut velit suscipit, congue tortor ac, molestie libero. Pellentesque non scelerisque nisl. Quisque nec pulvinar augue, eu gravida augue. Sed ullamcorper lorem eu lacus molestie, a mattis dui porttitor. Suspendisse vehicula elementum luctus. Praesent luctus eros sit amet auctor imperdiet. Mauris fringilla nisi massa, nec iaculis magna tempus vitae. Praesent suscipit tortor a lectus ultrices, sit amet condimentum sem imperdiet. Donec quis rutrum dolor. Duis ut nisl ac arcu maximus fermentum.</p>
    <p>Aenean mi metus, eleifend at gravida eget, blandit quis mi. Nunc mauris elit, malesuada nec tortor et, tempor cursus sapien. Curabitur facilisis malesuada mauris, in porttitor nunc tristique at. Fusce et nisi at nibh imperdiet vehicula nec in orci. Duis arcu velit, pulvinar a mauris volutpat, lobortis scelerisque urna. Suspendisse et lectus congue, pharetra enim eu, ultricies dolor. Maecenas arcu sem, iaculis ac lobortis et, vulputate in lacus. Nam non turpis fringilla, ornare lacus bibendum, eleifend purus. Aenean accumsan quam vitae eros placerat aliquam sed a orci. Suspendisse sed sodales magna. Nunc feugiat, magna eget ornare suscipit, nulla urna scelerisque tortor, vel facilisis lectus felis sed enim. Aliquam fermentum blandit nisi ac aliquam.</p>
    <p>Duis pellentesque massa turpis, eu tincidunt augue feugiat nec. Vivamus fermentum ornare diam, in rutrum neque. Suspendisse enim dolor, finibus finibus finibus at, semper vitae purus. In porttitor mi vitae nisi maximus, at vehicula mauris sagittis. Nullam quis blandit risus, quis imperdiet enim. Nulla blandit dignissim lacus. Fusce et vestibulum mauris. Fusce et metus id enim consequat gravida vel sit amet erat. Sed et arcu lectus. Class.</p><br>
    <p></p>
    """
    And I click on "HTML" "button"
    And I click on "Insert or edit an audio/video file" "button"
    And I click on "Audio" "link"
    And I click on "Browse repositories..." "button" in the "#id_description_editor_audio .atto_media_source.atto_media_media_source" "css_element"
    And I click on "Private files" "link" in the ".fp-repo-area" "css_element"
    And I click on "moodle-logo.mp4" "link"
    And I click on "Select this file" "button"
    And I click on "Advanced settings" "link" in the "#id_description_editor_audio" "css_element"
    And the field "audio_media-controls-toggle" matches value "1"
    And I set the field "audio_media-autoplay-toggle" to "1"
    And I set the field "audio_media-mute-toggle" to "1"
    And I set the field "audio_media-loop-toggle" to "1"
    And I click on "Insert media" "button"
    And I click on "Insert or edit an audio/video file" "button"
    And I click on "Video" "link"
    And I click on "Browse repositories..." "button" in the "#id_description_editor_video .atto_media_source.atto_media_media_source" "css_element"
    And I click on "Private files" "link" in the ".fp-repo-area" "css_element"
    And I click on "moodle-logo.webm" "link"
    And I click on "Select this file" "button"
    And I click on "Advanced settings" "link"
    And the field "Show controls" matches value "1"
    And I set the field "Play automatically" to "1"
    And I set the field "Muted" to "1"
    And I set the field "Loop" to "1"
    When I click on "Insert media" "button"
    Then I should see "Words: 430"
