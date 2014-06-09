Server.create(name: "wikidlabs", machine_name: "wikidlabs.com")
Company.create(name: "DemoMe", join_date: "5/1/2014")
Company.create(name: "NoMoMe", join_date: "5/1/2014", is_active: false)

@tab1 = Table.create(name: "products")
@tab1col1 = Column.create(table_id: @tab1.id, name: "id", ordinal_position: 0, default_value: nil, data_type: "integer", is_nullable: false, is_primary_key: true, is_auto_increment: true)
@tab1col2 = Column.create(table_id: @tab1.id, name: "name", ordinal_position: 1, default_value: nil, data_type: "VARCHAR(255)", is_nullable: false)
@tab1col3 = Column.create(table_id: @tab1.id, name: "weight", ordinal_position: 3, default_value: "0", data_type: "integer", is_nullable: true)
@tab1col4 = Column.create(table_id: @tab1.id, name: "qty_on_hand", ordinal_position: 2, default_value: "0", data_type: "integer", is_nullable: true)
@tab1col5 = Column.create(table_id: @tab1.id, name: "price", ordinal_position: 4, default_value: "0", data_type: "DecImal(8,2)", is_nullable: true)
@tab1col6 = Column.create(table_id: @tab1.id, name: "category_id", ordinal_position: 5, default_value: "0", data_type: "integer", is_nullable: true)

@tab2 = Table.create(name: "categories")
@tab2col1 = Column.create(table_id: @tab2.id, name: "id", ordinal_position: 0, default_value: nil, data_type: "integer", is_nullable: false, is_primary_key: true, is_auto_increment: true)
@tab2col2 = Column.create(table_id: @tab2.id, name: "name", ordinal_position: 1, default_value: nil, data_type: "VARCHAR(255)", is_nullable: false)

@fk1 = Relationship.create(name: "fk_products_categories", parent_table_id: @tab2.id, child_table_id: @tab1.id)
RelationshipColumn.create(relationship_id: @fk1.id, ordinal_position: 0, parent_column_id: @tab2col1.id, child_column_id: @tab2col2.id)

@diagram1 = Diagram.create(name: "Default")
DiagramsTable.create(diagram_id: @diagram1.id, table_id: @tab1.id)
DiagramsTable.create(diagram_id: @diagram1.id, table_id: @tab2.id)
