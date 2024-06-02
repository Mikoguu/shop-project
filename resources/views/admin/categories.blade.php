@extends('layouts.app')

@section('content')
    <div class="content-middle">
        @foreach($categories as $category)
        <li>
            <span>{{ $category->name }}</span>
            <a href="{{ route('category.remove', $category->id) }}" class="btn">Удалить</a>
            <form method="POST" action="{{ route('category.edit', $category->id) }}">
                @csrf
                @method('POST')
                <span>Название</span>
                <input type="text" name="name" value="{{ $category->name }}"></input><br><br>
                <span>Описание</span>
                <input style="width: 250px; height: 50px;" type="text" value="{{ $category->description }}" name="description"></input><br><br>
                <input type="submit" value="Отправить">
            </form>
        </li>
        @endforeach
        <h3>Добавить категорию</h3>
        <div class="add-category__form">
            <form method="POST" action="{{ route('category.add')}}">
                @csrf
                <span>Название</span>
                <input type="text" value="" name="name"></input><br><br>
                <span>Описание</span>
                <textarea style="width: 250px; height: 50px;" type="text" value="" name="description"></textarea><br><br>
                <input type="submit" value="Отправить">
            </form>
        </div>  
</div>
@endsection