# Create an active comany
@companyA = Company.create(name: "DemoMe", join_date: "5/1/2014")

# Assign a server to ComanyA
Server.create(name: "wikidlabs", machine_name: "wikidlabs.com", company_id: @companyA.id)

# Create the products table with columns
@tab1 = Table.create(name: "products")
@tab1col1 = Column.create(table_id: @tab1.id, name: "id", ordinal_position: 0, default_value: nil, data_type: "integer", is_nullable: false, is_primary_key: true, is_auto_increment: true)
@tab1col2 = Column.create(table_id: @tab1.id, name: "name", ordinal_position: 1, default_value: nil, data_type: "VARCHAR(255)", is_nullable: false)
@tab1col3 = Column.create(table_id: @tab1.id, name: "weight", ordinal_position: 3, default_value: "0", data_type: "integer", is_nullable: true)
@tab1col4 = Column.create(table_id: @tab1.id, name: "qty_on_hand", ordinal_position: 2, default_value: "0", data_type: "integer", is_nullable: true)
@tab1col5 = Column.create(table_id: @tab1.id, name: "price", ordinal_position: 4, default_value: "0", data_type: "DecImal(8,2)", is_nullable: true)
@tab1col6 = Column.create(table_id: @tab1.id, name: "category_id", ordinal_position: 5, default_value: "0", data_type: "integer", is_nullable: true)

# Create the categories table with columns
@tab2 = Table.create(name: "categories")
@tab2col1 = Column.create(table_id: @tab2.id, name: "id", ordinal_position: 0, default_value: nil, data_type: "integer", is_nullable: false, is_primary_key: true, is_auto_increment: true)
@tab2col2 = Column.create(table_id: @tab2.id, name: "name", ordinal_position: 1, default_value: nil, data_type: "VARCHAR(255)", is_nullable: false)

# Create a relationship between products and categories
@fk1 = Relationship.create(name: "fk_products_categories", parent_table_id: @tab2.id, child_table_id: @tab1.id)
RelationshipColumn.create(relationship_id: @fk1.id, ordinal_position: 0, parent_column_id: @tab2col1.id, child_column_id: @tab2col2.id)

# Create the Default diagram and assign it to CompanyA
@diagram1 = Diagram.create(name: "Default", company_id: @companyA.id)

# Assign products and categories to the Default diagram
DiagramsTable.create(diagram_id: @diagram1.id, table_id: @tab1.id, top: 100, left: 5)
DiagramsTable.create(diagram_id: @diagram1.id, table_id: @tab2.id, top: 100, left: 105)

# Create an inactive company ToDo: Add assets to this company
@companyB = Company.create(name: "NoMoMe", join_date: "5/1/2014", is_active: false)