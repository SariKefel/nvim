local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local f = ls.function_node

-- Helper to get filename without extension for component name
local function filename()
  return f(function()
    local name = vim.fn.expand '%:t:r'
    if name == '' then
      return 'Component'
    end
    -- Convert to PascalCase if needed
    return name:gsub('^%l', string.upper)
  end)
end

return {
  -- Page component with metadata
  s('npage', {
    t { "import type { Metadata } from 'next'", '', '' },
    t 'export const metadata: Metadata = {',
    t { '', "    title: '" },
    i(1, 'Page Title'),
    t { "',", "    description: '" },
    i(2, 'Page description'),
    t { "',", '}', '', '' },
    t { 'interface Props {', '    params: Promise<{ ' },
    i(3, 'slug'),
    t { ': string }>', '}', '', '' },
    t 'export default async function ',
    filename(),
    t { '({ params }: Props) {', '    const { ' },
    i(4, 'slug'),
    t { ' } = await params', '', '    return (', '        <div>', '            ' },
    i(0, '{/* Page content */}'),
    t { '', '        </div>', '    )', '}', '' },
  }),

  -- Layout component
  s('nlayout', {
    t { "import type { Metadata } from 'next'", '', '' },
    t 'export const metadata: Metadata = {',
    t { '', "    title: '" },
    i(1, 'App Title'),
    t { "',", "    description: '" },
    i(2, 'App description'),
    t { "',", '}', '', '' },
    t { 'interface Props {', '    children: React.ReactNode', '}', '', '' },
    t 'export default function ',
    filename(),
    t { '({ children }: Props) {', '    return (', '        <html lang="en">', '            <body>' },
    t { '', '                ' },
    i(0, '{children}'),
    t { '', '            </body>', '        </html>', '    )', '}', '' },
  }),

  -- Loading component
  s('nloading', {
    t { 'export default function Loading() {', '    return (', '        <div className="' },
    i(1, 'flex items-center justify-center min-h-screen'),
    t { '">', '            ' },
    i(0, '<span>Loading...</span>'),
    t { '', '        </div>', '    )', '}', '' },
  }),

  -- Error boundary component
  s('nerror', {
    t { "'use client'", '', '' },
    t { 'interface Props {', '    error: Error & { digest?: string }', '    reset: () => void', '}', '', '' },
    t { 'export default function Error({ error, reset }: Props) {', '    return (' },
    t { '', '        <div className="' },
    i(1, 'flex flex-col items-center justify-center min-h-screen gap-4'),
    t { '">', '            <h2>Something went wrong!</h2>' },
    t { '', '            <button onClick={() => reset()}>Try again</button>' },
    t { '', '        </div>', '    )', '}', '' },
  }),

  -- Not found component
  s('nnfound', {
    t { "import Link from 'next/link'", '', '' },
    t { 'export default function NotFound() {', '    return (' },
    t { '', '        <div className="' },
    i(1, 'flex flex-col items-center justify-center min-h-screen gap-4'),
    t { '">', '            <h2>Not Found</h2>' },
    t { '', "            <p>Could not find the requested resource</p>" },
    t { '', '            <Link href="/">Return Home</Link>' },
    t { '', '        </div>', '    )', '}', '' },
  }),

  -- Client component
  s('nclient', {
    t { "'use client'", '', '' },
    t { "import { useState } from 'react'", '', '' },
    t 'export default function ',
    filename(),
    t { '() {', '    const [' },
    i(1, 'state'),
    t ', set',
    i(2, 'State'),
    t '] = useState(',
    i(3, 'null'),
    t { ')', '', '    return (', '        <div>', '            ' },
    i(0, '{/* Client component content */}'),
    t { '', '        </div>', '    )', '}', '' },
  }),

  -- Server component
  s('nserver', {
    t { 'interface Props {', '    ' },
    i(1, '// props'),
    t { '', '}', '', '' },
    t 'export default async function ',
    filename(),
    t { '({}: Props) {', '    ' },
    i(2, '// Fetch data here'),
    t { '', '', '    return (', '        <div>', '            ' },
    i(0, '{/* Server component content */}'),
    t { '', '        </div>', '    )', '}', '' },
  }),

  -- Server action
  s('naction', {
    t { "'use server'", '', '' },
    t { 'export async function ' },
    i(1, 'actionName'),
    t '(formData: FormData) {',
    t { '', "    const " },
    i(2, 'field'),
    t " = formData.get('",
    i(3, 'fieldName'),
    t { "')", '', '    ' },
    i(0, '// Action logic'),
    t { '', '}', '' },
  }),

  -- API route handler
  s('napi', {
    t { "import { NextRequest, NextResponse } from 'next/server'", '', '' },
    t { 'export async function GET(request: NextRequest) {', '    ' },
    i(1, '// GET logic'),
    t { '', '', '    return NextResponse.json({ ' },
    i(2, 'data'),
    t { ' })', '}', '', '' },
    t { 'export async function POST(request: NextRequest) {', '    const body = await request.json()' },
    t { '', '    ' },
    i(0, '// POST logic'),
    t { '', '', '    return NextResponse.json({ success: true })', '}', '' },
  }),

  -- Next.js Image component
  s('nimage', {
    t { "import Image from 'next/image'", '', '' },
    t '<Image',
    t { '', '    src="' },
    i(1, '/image.png'),
    t { '"', '    alt="' },
    i(2, 'Description'),
    t { '"', '    width={' },
    i(3, '500'),
    t { '}', '    height={' },
    i(4, '300'),
    t { '}', '    ' },
    i(0),
    t { '', '/>' },
  }),

  -- Next.js Link component
  s('nlink', {
    t { "import Link from 'next/link'", '', '' },
    t '<Link href="',
    i(1, '/'),
    t '">',
    t { '', '    ' },
    i(0, 'Link text'),
    t { '', '</Link>' },
  }),

  -- Metadata export
  s('nmeta', {
    t { "import type { Metadata } from 'next'", '', '' },
    t 'export const metadata: Metadata = {',
    t { '', "    title: '" },
    i(1, 'Title'),
    t { "',", "    description: '" },
    i(2, 'Description'),
    t { "',", '    openGraph: {', "        title: '" },
    i(3, 'OG Title'),
    t { "',", "        description: '" },
    i(4, 'OG Description'),
    t { "',", '    },', '}', '' },
    i(0),
  }),

  -- Async data fetch pattern
  s('nfetch', {
    t 'async function get',
    i(1, 'Data'),
    t '() {',
    t { '', "    const res = await fetch('" },
    i(2, 'https://api.example.com/data'),
    t { "', {", "        next: { revalidate: " },
    i(3, '3600'),
    t { ' },', '    })' },
    t { '', '', '    if (!res.ok) {', "        throw new Error('Failed to fetch data')", '    }' },
    t { '', '', '    return res.json()', '}', '' },
    i(0),
  }),

  -- useRouter hook
  s('nrouter', {
    t { "'use client'", '', '' },
    t { "import { useRouter } from 'next/navigation'", '', '' },
    t 'export default function ',
    filename(),
    t { '() {', '    const router = useRouter()', '', '    ' },
    i(0, '// Use router.push(), router.replace(), router.back()'),
    t { '', '', '    return (', '        <div>', '            {/* Component content */}', '        </div>', '    )', '}', '' },
  }),

  -- useParams hook
  s('nparams', {
    t { "'use client'", '', '' },
    t { "import { useParams } from 'next/navigation'", '', '' },
    t 'export default function ',
    filename(),
    t { '() {', '    const params = useParams<{ ' },
    i(1, 'slug'),
    t { ': string }>()', '', '    return (', '        <div>', '            ' },
    i(0, '{/* Component content */}'),
    t { '', '        </div>', '    )', '}', '' },
  }),

  -- useSearchParams hook
  s('nsearch', {
    t { "'use client'", '', '' },
    t { "import { useSearchParams } from 'next/navigation'", '', '' },
    t 'export default function ',
    filename(),
    t { '() {', '    const searchParams = useSearchParams()', "    const " },
    i(1, 'query'),
    t " = searchParams.get('",
    i(2, 'q'),
    t { "')", '', '    return (', '        <div>', '            ' },
    i(0, '{/* Component content */}'),
    t { '', '        </div>', '    )', '}', '' },
  }),
}
