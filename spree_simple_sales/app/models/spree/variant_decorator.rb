module Spree
  Variant.class_eval do
  # We alias `price_in` method to `orig_price_in` and override it
    alias_method :orig_price_in, :price_in
    def price_in(currency)
    # If there is a `sale_price` on the product's master variant we return it otherwise we
    # call the original implementation of `price_in`
      return orig_price_in(currency) unless sale_price.present?
      Spree::Price.new(:variant_id => self.id, :amount => self.sale_price, :currency => currency)
    end
  end
end
