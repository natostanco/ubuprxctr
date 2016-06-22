import asyncio
from proxybroker import Broker

async def use(proxies):
    while True:
        proxy = await proxies.get()
        if proxy is None:
            break
        else:
            print(str(proxy.host)+':'+str(proxy.port))

async def find(proxies, loop):
    broker = Broker(queue=proxies,
                    timeout=5,
                    max_tries=2,
                    max_conn=400,
                    judges=['https://httpheader.net/', 'http://httpheader.net/'],
                    verify_ssl=False,
                    loop=loop)

    # only anonymous & high levels of anonymity for http protocol and high for others:
    types = [('HTTP', ('Anonymous', 'High')), 'HTTPS', 'SOCKS4', 'SOCKS5']
    countries = []
    limit = 10000

    await broker.find(types=types, limit=limit)

if __name__ == '__main__':
    loop = asyncio.get_event_loop()
    proxies = asyncio.Queue(loop=loop)
    tasks = asyncio.gather(find(proxies, loop), use(proxies))
    loop.run_until_complete(tasks)
