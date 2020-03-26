# google_chat_message plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-google_chat_message)

![](https://github.com/dbgarcia/fastlane-plugin-google_chat_message/blob/develop/images/googlechatmessage.jpg?raw=true)
## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-google_chat_message`, add it to your project by running:

```bash
fastlane add_plugin google_chat_message
```

## About google_chat_message

Send simple text messages to Google Chat

- Including links in message text

    To provide alternate link text for your link, use the following syntax: 
    ````ruby
    <https://example.com/foo|my link text>
    ````
    Example:
    ````ruby
    send_text = "Hey click \n<https://jenkins.io/|my link text> 🌐!"
    ````

    Rendering Message: 
    
     Hey click [my link text](https://jenkins.io/) 🌐!
      
      

- Messages that @mention specific users

    A bot can @mention a user in a message, providing the user ID in the following syntax:
    ````
    <users/USER_ID>
    ````
    Example:
    ````ruby
    send_text = "Hey <users/123456789012345678901> go 🏄‍♂️!"
    ````
    Rendering Message: 
    
       Hey @Josh go 🏄‍♂️!
       
       
    
- Using formatted text in messages
    
     [Basic formatting to the message text, including bold, italic, and strikethrough](https://developers.google.com/hangouts/chat/reference/message-formats/basic#using_formatted_text_in_messages)


## Example

Check out the [example `Fastfile`](fastlane/Fastfile) to see how to use this plugin. Try it by cloning the repo, running `fastlane install_plugins` and `bundle exec fastlane test`.

````ruby
send_text = "Thank you for using Google Chat Message! 🎉"

google_chat_message(
      text: send_text, 
      webhook: 'http:// webhook'
    )
````



## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
