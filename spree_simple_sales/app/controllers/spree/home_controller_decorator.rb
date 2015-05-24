module Spree
  HomeController.class_eval do
    def sale
    # This selects only the products that have a variant with a `sale_price` set
      @products = Product.joins(:variants_including_master)
                         .where('spree_variants.sale_price is not null').uniq
    end
  end
end
