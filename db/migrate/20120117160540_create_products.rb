class CreateProducts < ActiveRecord::Migration
  def change
    execute "
    create table products (
      id serial primary key,
      sell_at timestamp without time zone,
      quantity integer not null,
      name text not null);

    create view buyable_products as (
        select * from products
        where sell_at < now()
      );
    "
  end
end
