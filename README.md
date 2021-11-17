# Clock-in App

```
rails db:create
rails db:migrate
```

If the following error is shown:

```
Webpacker::Manifest::MissingEntryError
```

Run the following command:

```
bundle exec rake webpacker:install
```

# Notes

Fixtures can be cleared with the following code:

```
before(:all) {Entry.destroy_all}
```
