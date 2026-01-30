local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- API route handler (GET/POST)
  s('napi', {
    t { "import { NextRequest, NextResponse } from 'next/server'", '', '' },
    t { 'export async function GET(request: NextRequest) {', '  ' },
    i(1, '// GET logic'),
    t { '', '', '  return NextResponse.json({ ' },
    i(2, 'data'),
    t { ' })', '}', '', '' },
    t { 'export async function POST(request: NextRequest) {', '  const body = await request.json()' },
    t { '', '  ' },
    i(0, '// POST logic'),
    t { '', '', '  return NextResponse.json({ success: true })', '}', '' },
  }),

  -- Server action
  s('naction', {
    t { "'use server'", '', '' },
    t { 'export async function ' },
    i(1, 'actionName'),
    t '(formData: FormData) {',
    t { '', "  const " },
    i(2, 'field'),
    t " = formData.get('",
    i(3, 'fieldName'),
    t { "')", '', '  ' },
    i(0, '// Action logic'),
    t { '', '}', '' },
  }),

  -- Async data fetch pattern
  s('nfetch', {
    t 'async function get',
    i(1, 'Data'),
    t '() {',
    t { '', "  const res = await fetch('" },
    i(2, 'https://api.example.com/data'),
    t { "', {", "    next: { revalidate: " },
    i(3, '3600'),
    t { ' },', '  })' },
    t { '', '', '  if (!res.ok) {', "    throw new Error('Failed to fetch data')", '  }' },
    t { '', '', '  return res.json()', '}', '' },
    i(0),
  }),

  -- Route handler with dynamic params
  s('napiparams', {
    t { "import { NextRequest, NextResponse } from 'next/server'", '', '' },
    t { 'interface Props {', '  params: Promise<{ ' },
    i(1, 'id'),
    t { ': string }>', '}', '', '' },
    t { 'export async function GET(', '  request: NextRequest,', '  { params }: Props', ') {' },
    t { '', '  const { ' },
    i(2, 'id'),
    t { ' } = await params', '  ' },
    i(0, '// GET logic'),
    t { '', '', '  return NextResponse.json({ data })', '}', '' },
  }),

  -- Middleware
  s('nmiddleware', {
    t { "import { NextResponse } from 'next/server'", "import type { NextRequest } from 'next/server'", '', '' },
    t { 'export function middleware(request: NextRequest) {', '  ' },
    i(1, '// Middleware logic'),
    t { '', '', '  return NextResponse.next()', '}', '', '' },
    t { 'export const config = {', "  matcher: '" },
    i(0, '/api/:path*'),
    t { "',", '}', '' },
  }),

  -- Type definitions for API response
  s('napitype', {
    t 'interface ',
    i(1, 'ApiResponse'),
    t { ' {', '  ' },
    i(2, 'data'),
    t ': ',
    i(3, 'unknown'),
    t { '', '  error?: string', '  message?: string', '}', '' },
    i(0),
  }),

  -- Zod schema for validation
  s('nzod', {
    t { "import { z } from 'zod'", '', '' },
    t 'export const ',
    i(1, 'schema'),
    t 'Schema = z.object({',
    t { '', '  ' },
    i(2, 'field'),
    t ': z.',
    i(3, 'string()'),
    t { ',', '})', '', '' },
    t 'export type ',
    i(4, 'Schema'),
    t ' = z.infer<typeof ',
    i(5, 'schema'),
    t { 'Schema>', '' },
    i(0),
  }),
}
