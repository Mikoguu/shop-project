@extends('layouts.app')

@section('content')
    <div class="content-middle">
        @foreach($products as $product)
        <li>
            <span>{{ $product->name }}</span>
           <a href="{{ route('product.remove', $product->id) }}" class="btn">Удалить</a>
            <form method="POST" action="{{ route('product.edit', $product->id) }}">
                @csrf
                @method('POST')
                <span>Название</span>
                <input type="text" name="name" value="{{ $product->name }}"></input><br><br>
                <span>Цена</span>
                <input type="text" name="price" value="{{ $product->price }}"></input><br><br>
                <span>Id категории</span>
                <input type="text" name="category_id" value="{{ $product->category_id }}"></input><br><br>
                <span>Описание</span>
                <input style="width: 250px; height: 50px;" type="text" value="{{ $product->description }}" name="description"></input><br><br>
                <input type="submit" value="Отправить">
            </form>
        </li>
        @endforeach
        <h3>Добавить игру</h3>
        <div class="add-product__form">
            <form method="POST" action="{{ route('product.add')}}">
                @csrf
                <span>Название</span>
                <input type="text" value="" name="name"></input><br><br>
                <span>Цена</span>
                <input type="text" name="price"></input><br><br>
                <span>Id категории</span>
                <input type="text" name="category_id"></input><br><br>
                <span>Описание</span>
                <textarea style="width: 250px; height: 50px;" type="text" value="" name="description"></textarea><br><br>
                <input type="submit" value="Отправить">
            </form>
        </div>  
</div>
@endsection