#encoding: UTF-8

module StandaloneTypograf
  module Quotes
    QUOTES = {
        outer: %w( « » ),
        inner: %w( „ “ ),
    }

    SOURCE = {
        double: '"'
    }

    def quotes
      arr_text = @text.split('')
      # [[0, :open], [10, :close]]
      quotes_tree = build_quotes_tree(arr_text)
      type_tree = build_type_tree(quotes_tree)
      # [[5, :open, :inner], [10, :close, :inner]]

      type_tree.each do |e|
        # ОТКРЫВАЮЩИЕ
        if e[1] == :open
          arr_text[e[0]] = (e[2] == :inner) ? @quotes[:inner][0] : @quotes[:outer][0]
        else
          # ЗАКРЫВАЮЩИЕ
          arr_text[e[0]] = (e[2] == :inner) ? @quotes[:inner][1] : @quotes[:outer][1]
        end
      end
      @text = arr_text.join
    end

    # PRIVATE
    #
    private

    # Вернет массив [[0, :open], [10, :close]]
    # Где цифра - индекс кавычки в тексте,
    # символ :open или :close - тип кавычки (открывающая или закрывающая)
    #
    def build_quotes_tree(arr_text)
      quotes_tree = []
      total = arr_text.size
      arr_text.each_with_index do |char, index|
        _next_, _prev_ = index + 1, index - 1
        # Если кавычка - первый символ в строке или за кавычкой примыкает буква,
        # то эта кавычка - открывающая.
        if char == SOURCE[:double]
          if index == 0 || (arr_text[_next_] != ' ' and arr_text[_prev_] == ' ')
            quotes_tree << [index, :open]
          # Ситуация с двойными кавычками идущими сразу за одинарными, например:
          # "Привет, "Медвед"".
          elsif arr_text[_prev_] == SOURCE[:double] and (arr_text[_next_] != ' ' and index + 1 != total)
            quotes_tree << [index, :open]
          else
            quotes_tree << [index, :close]
          end
        end
      end
      quotes_tree
    end

    # Вернет массив [[0, :open, :outer], [10, :close, :outer]]
    #
    def build_type_tree(quotes_tree)
      type_tree = quotes_tree.clone
      # [[0, :open], [10, :close]]
      quotes_tree.each_with_index do |e, i|
        even = (i%2 == 0)? true : false
        # ОТКРЫВАЮЩИЕ КАВЫЧКИ
        if e[1] == :open
          # Каждая кавычка с четным индексом (или индексом == 0)
          # внешняя.
          if even || i == 0
            type_tree[i] << :outer
          else
            type_tree[i] << :inner
          end
        end

        # ЗАКРЫВАЮЩИЕ КАВЫЧКИ
        if e[1] == :close
          # Каждая нечётная кавычка (или кавычка с индексом = 1) - внешняя
          if !even || i == 1
            type_tree[i] << :outer
          else
            type_tree[i] << :inner
          end
        end
        type_tree
      end
    end
  end
end