class ProductDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      id: { source: "Product.id", cond: :eq },
      name: { source: "Product.name", cond: :like,searchable: true },
      current_price: {source: "Product.current_price" ,searchable: true},
      actual_price: {source:"Product.actual_price",searchable: true},
      categories: {source: "Product.categories"},
      discount: {source: "Product.discount",searchable:true},
      rating: {source: "Product.rating",cond: :like}
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        name: record.name,
        current_price: record.current_price,
        actual_price: record.actual_price,
        categories: record.categories,
        discount: record.discount,
        rating: record.rating,
        DT_RowId: record.id
      }
    end
  end

  def get_raw_records
    Product.all
  end

end
