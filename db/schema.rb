# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_617_165_300) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'pgcrypto'
  enable_extension 'plpgsql'

  create_table 'addresses', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'zip_code'
    t.string 'address'
    t.string 'address_number'
    t.string 'complement'
    t.string 'state'
    t.string 'city'
    t.string 'neighborhood'
    t.string 'addressable_type', null: false
    t.uuid 'addressable_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['address'], name: 'index_addresses_on_address'
    t.index ['address_number'], name: 'index_addresses_on_address_number'
    t.index %w[addressable_type addressable_id], name: 'index_addresses_on_addressable'
    t.index ['city'], name: 'index_addresses_on_city'
    t.index ['complement'], name: 'index_addresses_on_complement'
    t.index ['neighborhood'], name: 'index_addresses_on_neighborhood'
    t.index ['state'], name: 'index_addresses_on_state'
    t.index ['zip_code'], name: 'index_addresses_on_zip_code'
  end

  create_table 'companies', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'document'
    t.string 'legal_name'
    t.string 'trade_name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['document'], name: 'index_companies_on_document'
    t.index ['legal_name'], name: 'index_companies_on_legal_name'
    t.index ['trade_name'], name: 'index_companies_on_trade_name'
  end

  create_table 'phones', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.integer 'phone_type'
    t.string 'phone_number'
    t.string 'phoneble_type', null: false
    t.uuid 'phoneble_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['phone_number'], name: 'index_phones_on_phone_number'
    t.index ['phone_type'], name: 'index_phones_on_phone_type'
    t.index %w[phoneble_type phoneble_id], name: 'index_phones_on_phoneble'
  end
end
