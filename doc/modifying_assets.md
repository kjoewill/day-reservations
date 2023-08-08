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
4. Verify systenm tests pass on GitHub and Heroku C/I Server then create a new heroku staging server with thatthe same build.  
5. Verify that the data migration ran and assets were updated appropriately on the staging server. Perform exploritoty testing.
6. Promote the staging server slug to the production server. and verify the data migration has run.
