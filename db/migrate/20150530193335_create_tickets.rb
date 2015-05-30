class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :ticketID
      t.references :eventID, index: true
      t.references :ownerID, index: true
      t.datetime :purchaseDate
      t.datetime :expirationDate
      t.decimal :price
      t.string :discount
      t.string :seat
      t.text :description
      t.text :tags

      t.timestamps
    end
  end
end
