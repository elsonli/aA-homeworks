class SnackBox
  SNACK_BOX_DATA = {
    1 => {
      "bone" => {
        "info" => "Phoenician rawhide",
        "tastiness" => 20
      },
      "kibble" => {
        "info" => "Delicately braised hamhocks",
        "tastiness" => 33
      },
      "treat" => {
        "info" => "Chewy dental sticks",
        "tastiness" => 40
      }
    },
    2 => {
      "bone" => {
        "info" => "An old dirty bone",
        "tastiness" => 2
      },
      "kibble" => {
        "info" => "Kale clusters",
        "tastiness" => 1
      },
      "treat" => {
        "info" => "Bacon",
        "tastiness" => 80
      }
    },
    3 => {
      "bone" => {
        "info" => "A steak bone",
        "tastiness" => 64
      },
      "kibble" => {
        "info" => "Sweet Potato nibbles",
        "tastiness" => 45
      },
      "treat" => {
        "info" => "Chicken bits",
        "tastiness" => 75
      }
    }
  }
  def initialize(data = SNACK_BOX_DATA)
    @data = data
  end

  def get_bone_info(box_id)
    @data[box_id]["bone"]["info"]
  end

  def get_bone_tastiness(box_id)
    @data[box_id]["bone"]["tastiness"]
  end

  def get_kibble_info(box_id)
    @data[box_id]["kibble"]["info"]
  end

  def get_kibble_tastiness(box_id)
    @data[box_id]["kibble"]["tastiness"]
  end

  def get_treat_info(box_id)
    @data[box_id]["treat"]["info"]
  end

  def get_treat_tastiness(box_id)
    @data[box_id]["treat"]["tastiness"]
  end
end

class CorgiSnacks

  def initialize(snack_box, box_id)
    @snack_box = snack_box
    @box_id = box_id
  end

  def bone
    info = @snack_box.get_bone_info(@box_id)
    tastiness = @snack_box.get_bone_tastiness(@box_id)
    result = "Bone: #{info}: #{tastiness} "
    tastiness > 30 ? "* #{result}" : result
  end

  def kibble
    info = @snack_box.get_kibble_info(@box_id)
    tastiness = @snack_box.get_kibble_tastiness(@box_id)
    result = "Kibble: #{info}: #{tastiness} "
    tastiness > 30 ? "* #{result}" : result
  end

  def treat
    info = @snack_box.get_treat_info(@box_id)
    tastiness = @snack_box.get_treat_tastiness(@box_id)
    result = "Treat: #{info}: #{tastiness} "
    tastiness > 30 ? "* #{result}" : result
  end
end


class MetaCorgiSnacks
  def initialize(snack_box, box_id)
    @snack_box = snack_box
    @box_id = box_id
    snack_box.methods.grep(/^get_(.*)_info$/) { MetaCorgiSnacks.define_snack $1 }
  end

  # Phase 1
  # load 'meta_corgis.rb'
  # snack_box = SnackBox.new
  # meta_snacks = MetaCorgiSnacks.new(snack_box, 1)
  # meta_snacks.bone
  # meta_snacks.kibble
  def method_missing(name, *args)

    # Create new method names to retrieve info
    new_info_method = "get_#{name}_info"

    # Create new method names to retrieve tastiness
    new_tastiness_method = "get_#{name}_tastiness"

    # Retrieve the data for info and tastiness using the new methods
    info = @snack_box.send(new_info_method.to_sym, @box_id)
    tastiness = @snack_box.send(new_tastiness_method.to_sym, @box_id)

    # Construct the result that will be printed out
    result = "#{name.capitalize}: #{info}: #{tastiness}"
    tastiness > 30 ? "* #{result}" : result
  end

  # Phase 2
  # load 'meta_corgis.rb'
  # snack_box = SnackBox.new
  # meta_snacks = MetaCorgiSnacks.new(snack_box, 1)
  # meta_snacks.bone
  # meta_snacks.kibble
  # meta_snacks.treat
  def self.define_snack(name)
    define_method(name) do
      # Create new method names to retrieve info
      new_info_method = "get_#{name}_info"

      # Create new method names to retrieve tastiness
      new_tastiness_method = "get_#{name}_tastiness"

      # Retrieve the data for info and tastiness using the new methods
      info = @snack_box.send(new_info_method.to_sym, @box_id)
      tastiness = @snack_box.send(new_tastiness_method.to_sym, @box_id)

      # Construct the result that will be printed out
      result = "#{name.capitalize}: #{info}: #{tastiness}"
      tastiness > 30 ? "* #{result}" : result
    end
  end
end