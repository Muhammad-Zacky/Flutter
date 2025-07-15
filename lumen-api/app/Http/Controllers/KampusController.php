<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Kampus;

class KampusController extends Controller
{
    public function index()
    {
        return response()->json(Kampus::all());
    }

    public function show($id)
    {
        $kampus = Kampus::find($id);
        if (!$kampus) return response()->json(['message' => 'Data tidak ditemukan'], 404);
        return response()->json($kampus);
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required',
            'alamat' => 'required',
            'no_telepon' => 'required',
            'category' => 'required',
            'lat' => 'required',
            'lng' => 'required',
        ]);

        $kampus = Kampus::create($request->all());
        return response()->json($kampus, 201);
    }

    public function update(Request $request, $id)
    {
        $kampus = Kampus::find($id);
        if (!$kampus) return response()->json(['message' => 'Data tidak ditemukan'], 404);

        $kampus->update($request->all());
        return response()->json($kampus);
    }

    public function destroy($id)
    {
        $kampus = Kampus::find($id);
        if (!$kampus) return response()->json(['message' => 'Data tidak ditemukan'], 404);

        $kampus->delete();
        return response()->json(['message' => 'Data berhasil dihapus']);
    }
}
