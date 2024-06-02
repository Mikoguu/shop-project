<div class="sidebar-item">
    <div class="sidebar-item__title">Категории</div>
        <div class="sidebar-item__content">
            <ul class="sidebar-category">
                @foreach ($categories as $category)
                <li class="sidebar-category__item">
                    <?php $isSelected = isset($currentCategory) && $currentCategory->id == $category->id ? '-active' : '' ?>
                    <a href="{{ route('category', $category->id) }}" class="sidebar-category__item__link{{ $isSelected }}">{{ $category->name }}</a>
                </li>
                @endforeach
              </ul>
    </div>
</div>