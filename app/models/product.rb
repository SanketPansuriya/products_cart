class Product < ApplicationRecord
    has_one_attached :product_image do |attachable|
        attachable.variant :thumb, resize_to_limit: [150, 150]
        attachable.variant :medium, resize_to_limit: [350, 350]
    end
    validate :acceptable_product_image


    private
    def acceptable_product_image
        return unless product_image.attached?

        unless product_image.byte_size <= 1.megabyte
            errors.add(:product_image, "is too big")
        end

        acceptable_types = ["image/jpeg", "image/png", "image/jpg"]
        unless acceptable_types.include?(product_image.content_type)
            errors.add(:product_image, "must be a JPEG or PNG")
        end
    end

end
