import { NextResponse } from 'next/server';
import { pinata } from '@/api/storage/config'

export const dynamic = 'force-dynamic';

export async function GET() {
    try {
        const url = pinata.upload.public.createSignedURL({
            expires: 30
        })

        return NextResponse.json({url: url}, { status: 200 });
    } catch (err) {
        console.log(err)
        return NextResponse.json({ text: "Error creating API key: "}, { status: 200 })
    }
}