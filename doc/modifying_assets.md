# Modyfying Assets
This system deployed with an initial set of Assets as defined in a migration named LoadProductionData. If this initial set of
assests needs to be changed - whether that be by adding additioanal assets, deleting current assets or changeing their sort order
- it is recommended that this be accomplished by using data migrations.


## Adding an asset
To add a new asset:
1. Create a new data migration file.  For an example see the example data migration named:
'add_example_asset'.
2. Run local integration and system tests (this will probably require running: `rails db:migrate RAILS_ENV=test` first)
3. Push changes to GitHub

